//
//  CarsWireframe.swift
//  Cars
//
//  Created by Nora Mounir on 5/26/18.
//  Copyright © 2018 nmounir. All rights reserved.
//

/*
 CarsWireframe defines the navigation between the screen before the car screen (NavigationController) and the screen after (car detail screen)
 */

import UIKit

class CarsWireframe: CarsWireframeProtocol {
    class func createCarsModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "NavigationController")
        if let view = navController.childViewControllers.first as? CarsView {
            let presenter: CarsPresenterProtocol & CarsInteractorOutputProtocol = CarsPresenter()
            let interactor:  CarsInteractorInputProtocol & NetworkingManagerOutputProtocol = CarsInteractor()
            let networkManager: NetworkingManagerInputProtocol = NetworkingManger()
            let wireFrame: CarsWireframeProtocol = CarsWireframe()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.networkManager = networkManager
            networkManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentCarDetailScreen(from view: CarsViewProtocol, forCar car: CarModel){
        let carDetailViewController = CarDetailsWireframe.createCarDetailsModule(forCar: car)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(carDetailViewController, animated: true)
        }
    }
}
