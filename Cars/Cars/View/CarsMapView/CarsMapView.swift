//
//  CarsMapView.swift
//  Cars
//
//  Created by Nora Mounir on 5/26/18.
//  Copyright © 2018 nmounir. All rights reserved.
//

/*
 CarsMapView displays the retrieved cars list on the map with annotations.
 */

import UIKit
import MapKit

class CarsMapView: UIViewController {
    
    @IBOutlet weak var mapView : MKMapView!
    var carsList = [CarModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        // set initial location & center map on Munich in Germany
        let initialLocation = CLLocation(latitude: 48.1351, longitude: 11.5820)
        centerMapOnLocation(location: initialLocation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //center the map camera to the given location with region radius
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  2000, 2000)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    //add the list of car objects conform to the MKAnnotation protocol on map
    public func addCarsOnMap(cars: [CarModel]){
        mapView.addAnnotations(carsList)
    }
    
    public func updateCarList(cars: [CarModel]){
        carsList = cars
        addCarsOnMap(cars: carsList)
    }
}

extension CarsMapView: MKMapViewDelegate {
    
    // return the view for each annotation
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard let annotation = annotation as? CarModel else { return nil }
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        // reuses annotation views that are no longer visible
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
}
