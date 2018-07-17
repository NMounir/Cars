//
//  CarsView.swift
//  Cars
//
//  Created by Nora Mounir on 5/26/18.
//  Copyright © 2018 nmounir. All rights reserved.
//

/*
 CarsView is a container view for the car list and car map views to allow switching between different display layout for the retrieved car data from the server. It conforms CarsViewProtocol where the view updates the appearance of its subviews interface.
 */

import UIKit
import PKHUD

class CarsView: UIViewController {
    
    @IBOutlet weak var viewContainer : UIView! //container view that holds the 2 sub views which will switch between them
    var views = [UIViewController]() //arry of the sub views to keep track of them
    
    var presenter: CarsPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        // initialize and add sub-views to the array
        views = [UIViewController]()
        views.append(CarsListView())
        views.append(CarsMapView())
        
        //loop throught the sub views and add them to the container view
        for subView in views {
            viewContainer.addSubview(subView.view)
        }
        viewContainer.bringSubview(toFront: views[0].view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //segmented control toggle action
    @IBAction func switchViewAction(_ sender: UISegmentedControl){
        self.viewContainer.bringSubview(toFront: views[sender.selectedSegmentIndex].view)
    }
}

extension CarsView: CarsViewProtocol {
    
    func showCars(cars: [CarModel]) {

        if let carsListView = views[0] as? CarsListView, let presenter = presenter {
            carsListView.updateCarList(cars: cars, presenterProtocol: presenter)
            carsListView.tableView.reloadData()
        }
        
        if let carsMap = views[1] as? CarsMapView{
            carsMap.updateCarList(cars: cars)
        }
    }
    
    func showError() {
        HUD.flash(.label("Error"), delay: 2.0)
    }

    func showLoading() {
        HUD.show(.progress)
    }

    func hideLoading() {
        HUD.hide()
    }
}
