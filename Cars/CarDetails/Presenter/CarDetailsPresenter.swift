//
//  CarDetailsPresenter.swift
//  Cars
//
//  Created by Nora Mounir on 5/27/18.
//  Copyright © 2018 nmounir. All rights reserved.
//

class CarDetailsPresenter: CarDetailsPresenterProtocol {
    
    weak var view: CarDetailsViewProtocol?
    var wireFrame: CarDetailsWireframeProtocol?
    var car: CarModel?
    
    func viewDidLoad() {
        if let car = car {
            view?.showCarDetails(forCar: car)
        }
    }
    
}
