//
//  CarDetailsWireframe.swift
//  Cars
//
//  Created by Nora Mounir on 5/27/18.
//  Copyright © 2018 nmounir. All rights reserved.
//

import UIKit

class CarDetailsWireframe: CarDetailsWireframeProtocol {
    
    class func createCarDetailsModule(forCar car: CarModel) -> UIViewController {

        let view = CarDetailsView()
        let presenter: CarDetailsPresenterProtocol = CarDetailsPresenter()
        let wireFrame: CarDetailsWireframeProtocol = CarDetailsWireframe()

        view.presenter = presenter
        presenter.view = view
        presenter.car = car
        presenter.wireFrame = wireFrame

        return view
        
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}
