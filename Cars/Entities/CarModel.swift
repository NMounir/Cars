//
//  CarModel.swift
//  Cars
//
//  Created by Nora Mounir on 5/26/18.
//  Copyright © 2018 nmounir. All rights reserved.
//

import Foundation
import ObjectMapper
import MapKit

/*
 CarModel represtents the entity component in VIPER architecture. This model struct holds info about the car. ObjectMapper is used to map our object model from JSON 
 */

class CarModel : NSObject, Mappable, MKAnnotation{    
    var id : String?
    var modelIdentifier : String?
    var title: String?
    var subtitle: String?
    var owner: String?
    var color: String?
    var latitude : Double?
    var longitude : Double?
    var series: String?
    var licensePlate : String?
    var carImageUrl : String?

    //To conform to the MKAnnotation protocol, we needed to construct the car coordinate from its latitude and longitude to be able to display it on the map
    var coordinate : CLLocationCoordinate2D{
        
        if let latitude = self.latitude, let longitude = self.longitude {
            return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        return kCLLocationCoordinate2DInvalid
    }
    
    required init?(map: Map) {
    }
    
    //Maps the json response attributes to the car properties
    func mapping(map: Map) {
        
        id                  <- map["id"]
        modelIdentifier     <- map["modelIdentifier"]
        title               <- map["modelName"]
        subtitle            <- map["make"]
        owner               <- map["name"]
        color               <- map["color"]
        series              <- map["series"]
        licensePlate        <- map["licensePlate"]
        latitude            <- map["latitude"]
        longitude           <- map["longitude"]
        carImageUrl         <- map["carImageUrl"]
    }
}
