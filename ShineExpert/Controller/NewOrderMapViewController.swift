//
//  NewOrderMapViewController.swift
//  ShineExpert
//
//  Created by Marina Lunts on 24.09.2018.
//  Copyright © 2018 Marina Lunts. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import GooglePlaces
import GoogleMaps


class NewOrderMapViewController: UIViewController  {

    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0

    @IBOutlet weak var mapView: GMSMapView!
    
    var marker: GMSMarker?
    var markerCoordinate: CLLocationCoordinate2D?
    
    // A default location to use when location permission is not granted.
    let defaultLocation = CLLocation(latitude: -33.869405, longitude: 151.199)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        loadMap()
        print("\(markerCoordinate)")

    }
    
    
    func loadMap() {
        // Initialize the location manager.
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self as CLLocationManagerDelegate
        
        placesClient = GMSPlacesClient.shared()
        
        // Create a map.
        let camera = GMSCameraPosition.camera(withLatitude: defaultLocation.coordinate.latitude,
                                              longitude: defaultLocation.coordinate.longitude,
                                              zoom: zoomLevel)
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        mapView?.animate(to: camera)
    }
}



extension NewOrderMapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        // Custom logic here
        mapView.clear()
        let marker = GMSMarker()
        marker.position = coordinate
    
        markerCoordinate = coordinate
        marker.map = mapView
    }
}



// Delegates to handle events for the location manager.
extension NewOrderMapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        guard status == .authorizedWhenInUse else {
            return
        }
        
        locationManager.startUpdatingLocation()
        
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        
        locationManager.stopUpdatingLocation()
    }
}
