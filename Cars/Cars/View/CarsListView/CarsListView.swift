//
//  CarsListView.swift
//  Cars
//
//  Created by Nora Mounir on 5/26/18.
//  Copyright © 2018 nmounir. All rights reserved.
//

/*
 CarsListView represnts the tableview where the retrieved data is listed. 
 */

import UIKit
import PKHUD

class CarsListView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: CarsPresenterProtocol?
    var carsList = [CarModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CarsListCell", bundle: nil), forCellReuseIdentifier: "customCell")

        // Do any additional setup after loading the view.
        tableView.tableFooterView = UIView()
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 108, 0);
    }
    
    public func updateCarList(cars: [CarModel], presenterProtocol: CarsPresenterProtocol){
        carsList = cars
        presenter = presenterProtocol
    }
}

extension CarsListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CarsListCell else { return UITableViewCell() }
        
        let car = carsList[indexPath.row]
        
        //if let carImageUrl = car.carImageUrl {
            
            cell.configureCell(with: car.carImageUrl,
                               placeholderImage: UIImage(named:"Placeholder"),
                               modelName: car.title,
                               makeName: car.subtitle)
       // }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter?.showCarDetail(forCar: carsList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carsList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}

