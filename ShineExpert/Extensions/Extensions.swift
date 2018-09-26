//
//  File.swift
//  ShineExpert
//
//  Created by Marina Lunts on 19.09.2018.
//  Copyright © 2018 Marina Lunts. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import GooglePlaces
import GoogleMaps

class BorderedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 20
        layer.borderColor = isEnabled ? tintColor.cgColor : UIColor.init(cgColor: 008481 as! CGColor) as! CGColor
    }
    
}


class PlaceHolderColor: UITextField {
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
        }
}
}

extension UILabel {
    func halfTextColorChange (fullText : String , changeText : String ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(red:0.11, green:0.51, blue:0.50, alpha:1.0), range: range)
        self.attributedText = attribute
    }
}

extension NewOrderMapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        // Custom logic here
        mapView.clear()
        let marker = GMSMarker()
        marker.position = coordinate
        print(marker.position.latitude)  //will print the x value or lat
        print(marker.position.longitude) //will print the y value or lng
        //markerCoordinate = coordinate
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


