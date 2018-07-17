//
//  CarDetailsProtocols.swift
//  Cars
//
//  Created by Nora Mounir on 5/27/18.
//  Copyright © 2018 nmounir. All rights reserved.
//

import UIKit

protocol CarDetailsViewProtocol: class {
    var presenter: CarDetailsPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showCarDetails(forCar car: CarModel)
}

protocol CarDetailsWireframeProtocol: class {
    static func createCarDetailsModule(forCar car: CarModel) -> UIViewController
}

protocol CarDetailsPresenterProtocol: class {
    var view: CarDetailsViewProtocol? { get set }
    var wireFrame: CarDetailsWireframeProtocol? { get set }
    var car: CarModel? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}
