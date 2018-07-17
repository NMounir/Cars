//
//  APIUrls.swift
//  Cars
//
//  Created by Nora Mounir on 5/26/18.
//  Copyright © 2018 nmounir. All rights reserved.
//

import Foundation

//Declare constants to hold the cars list & car image base URL
struct API {
    static let carsBaseUrl = "http://www.codetalk.de/"
    static let carImageBaseUrl = "https://content.drive-now.com/sites/default/files/cars/3x/"
}

protocol APIUrl {
    var path: String { get }
    var url: String { get }
}

//construct and return the final path for each api endpoint
enum APIUrls {
    enum CarsList: APIUrl {//cars list api url
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "cars.json"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.carsBaseUrl)\(path)"
            }
        }
    }
    
    enum CarImage: APIUrl {//car image api url
        
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return ""
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.carImageBaseUrl)\(path)"
            }
        }
    }
}
