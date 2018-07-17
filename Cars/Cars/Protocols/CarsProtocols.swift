//
//  CarsProtocols.swift
//  Cars
//
//  Created by Nora Mounir on 5/26/18.
//  Copyright © 2018 nmounir. All rights reserved.
//

/*
 Represents all the communication protocols between the Cars Scene's different VIPER pattern components used to construct the Cars Scene
 */

import UIKit

protocol CarsViewProtocol: class {
    var presenter: CarsPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showCars(cars: [CarModel])
    func showError()
    func showLoading()
    func hideLoading()
}

protocol CarsWireframeProtocol: class {
    static func createCarsModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentCarDetailScreen(from view: CarsViewProtocol, forCar car: CarModel)
}

protocol CarsPresenterProtocol: class {
    var view: CarsViewProtocol? { get set }
    var interactor: CarsInteractorInputProtocol? { get set }
    var wireFrame: CarsWireframeProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showCarDetail(forCar car: CarModel)

}

protocol CarsInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveCars(_ cars: [CarModel])
    func onError()
}

protocol CarsInteractorInputProtocol: class {
    var presenter: CarsInteractorOutputProtocol? { get set }
    var networkManager: NetworkingManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveCars()
}

protocol NetworkingManagerInputProtocol: class {
    var remoteRequestHandler: NetworkingManagerOutputProtocol? { get set }
    
    // INTERACTOR -> NETWORKINGMANAGER
    func retrieveCars()
}

protocol NetworkingManagerOutputProtocol: class {
    // NETWORKINGMANAGER -> INTERACTOR
    func onCarsRetrieved(_ cars: [CarModel])
    func onError()
}
