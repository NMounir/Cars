//
//  NetworkingManager.swift
//  Cars
//
//  Created by Nora Mounir on 5/26/18.
//  Copyright © 2018 nmounir. All rights reserved.
//

/*
 NetworkingManager handles APIs requests coming as input protocol to NetworkingManagerInputProtocol.
 The responses of these APIs requests are then passed as output to the NetworkingManagerOutputProtocol after being mapped to Objects using AlamofireObjectMapper.
 */

import Foundation
import Alamofire
import AlamofireObjectMapper

class NetworkingManger : NetworkingManagerInputProtocol {
    
    var remoteRequestHandler: NetworkingManagerOutputProtocol? //Network Manager output protocol
    
    //retrieve a list of Cars from the server using Alamofire networking library 
    func retrieveCars() {
        Alamofire
            .request(APIUrls.CarsList.fetch.url, method: .get) //perform an HTTP GET request with the provided url
            .validate() //automatic validation checks that the response returns a valid HTTP Code between 200 and 299
            .responseArray(completionHandler: { (response: DataResponse<[CarModel]>) in
                switch response.result {// Check that the response was successful, otherwise return an error
                case .success( _):
                    if let carsArray = response.result.value {
                        self.remoteRequestHandler?.onCarsRetrieved(carsArray) //return the results received from the server
                    }
                case .failure( _):
                    self.remoteRequestHandler?.onError() //return an error
                }
            })
    }
}
