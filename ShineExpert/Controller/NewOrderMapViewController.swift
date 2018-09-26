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
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var marker: GMSMarker?
    
    // A default location to use when location permission is not granted.
    let defaultLocation = CLLocation(latitude: -33.869405, longitude: 151.199)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        loadMap()
        sideMenu()
        
    }
    
    
    func loadMap() {
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

    func sideMenu() {
        if revealViewController != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController()?.rearViewRevealWidth = 250
            view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        }
        makeBarTransparent()
    }
    
    func makeBarTransparent() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }

}

