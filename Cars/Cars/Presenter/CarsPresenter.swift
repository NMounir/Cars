//
//  CarsPresenter.swift
//  Cars
//
//  Created by Nora Mounir on 5/26/18.
//  Copyright © 2018 nmounir. All rights reserved.
//

/*
 CarsPresenter communicates with the CarsIneractor through CarsInteractorInputProtocol to retrieve cars list. The presenter conform to CarsInteractorOutputProtocol where the CarsIneractor response back with the data retrieval results. The presenter in turn update the View with the results.
 */

class CarsPresenter : CarsPresenterProtocol {
    
    weak var view: CarsViewProtocol?
    var interactor: CarsInteractorInputProtocol?
    var wireFrame: CarsWireframeProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveCars()
    }
    
    func showCarDetail(forCar car: CarModel) {
        if let view = view {
            wireFrame?.presentCarDetailScreen(from: view, forCar: car)
        }
    }
}

extension CarsPresenter: CarsInteractorOutputProtocol {
    
    func didRetrieveCars(_ cars: [CarModel]) {
        view?.hideLoading()
        view?.showCars(cars: cars)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}
