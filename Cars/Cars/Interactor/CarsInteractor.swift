//
//  CarsInteractor.swift
//  Cars
//
//  Created by Nora Mounir on 5/26/18.
//  Copyright © 2018 nmounir. All rights reserved.
//

/*
 CarsInteractor is responsible for retrieving car list data from the NetworkingManager through conforming NetworkingManagerOutputProtocol. In turn, the interactor update the presenter with the results.
*/

import Foundation

class CarsInteractor : CarsInteractorInputProtocol{
    weak var presenter: CarsInteractorOutputProtocol?
    var networkManager: NetworkingManagerInputProtocol?
    
    func retrieveCars() {
        networkManager?.retrieveCars()
    }
}
extension CarsInteractor: NetworkingManagerOutputProtocol {

    func onCarsRetrieved(_ cars: [CarModel]) {
        presenter?.didRetrieveCars(cars)
    }
    
    func onError() {
        presenter?.onError()
    }
}
