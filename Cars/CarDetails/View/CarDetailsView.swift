//
//  CarDetailsView.swift
//  Cars
//
//  Created by Nora Mounir on 5/27/18.
//  Copyright © 2018 nmounir. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class CarDetailsView: UIViewController {

    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var modelNameLabel: UILabel!
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var seriesLabel: UILabel!
    @IBOutlet weak var licensePlateLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
    var presenter: CarDetailsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension CarDetailsView: CarDetailsViewProtocol {

    //Show car details of the selected car
    func showCarDetails(forCar car: CarModel) {
        
        //update car details labels of the selected car
        modelNameLabel?.text = "Model:  \(String(describing: car.title))"
        makeLabel?.text = "Make: \(String(describing:car.subtitle))"
        ownerLabel?.text = "Owner: \(String(describing:car.owner))"
        seriesLabel?.text = "Series: \(String(describing:car.series))"
        licensePlateLabel?.text = "License Plate: \(String(describing:car.licensePlate))"
        colorLabel?.text = "Color: \(String(describing: car.color))"
        
        guard let urlString = car.carImageUrl else {
            return
        }
        
        guard let carImageUrl = URL(string: urlString) else {
            return
        }

        if let placeholderImage = UIImage(named: "Placeholder") {
            let size = carImageView.frame.size
            
            carImageView.contentMode = .scaleAspectFill
            carImageView.af_setImage(
                withURL: carImageUrl,
                placeholderImage: placeholderImage,
                filter: AspectScaledToFitSizeFilter(size: size),
                imageTransition: .crossDissolve(0.2)
            )
        } else {
            print("There was no such image as Placeholder")
        }
    }
}
