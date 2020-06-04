//
//  detailMapViewController.swift
//  girisdeneme
//
//  Created by MEHMET ONUR ÜSTÜNEL on 4.04.2020.
//  Copyright © 2020 MEHMET ONUR ÜSTÜNEL. All rights reserved.
//  twitter.com/onur_ustunel

import UIKit
import MapKit
import CoreLocation


class detailMapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var detailMapView: MKMapView!
    var chosenLatitude = ""
    var chosenLongitude = ""
    var chosenPlace = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailMapView.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        latitudeLabel.text = chosenLatitude
        longitudeLabel.text = chosenLongitude
        
        chosenLocation()
        
       
        
        
        
    }
    
    func chosenLocation() {
        
        let location = CLLocationCoordinate2D(latitude: Double(self.chosenLatitude)!, longitude: Double(self.chosenLongitude)!)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.035, longitudeDelta: 0.035)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.detailMapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = chosenPlace
        
       
        self.detailMapView.addAnnotation(annotation)
        
        
    }


  
    @IBAction func mapCloseClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
      
        
    }
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            let button = UIButton(type: .detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        } else {
            pinView?.annotation = annotation
        }
        
        return pinView
        
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if Double(self.chosenLatitude) != 0.0 && Double(self.chosenLongitude) != 0.0 {
            let requestLocation = CLLocation(latitude:  Double(self.chosenLatitude)!, longitude:  Double(self.chosenLongitude)!)
            
            CLGeocoder().reverseGeocodeLocation(requestLocation) { (placemarks, error) in
                if let placemark = placemarks {
                    
                    if placemark.count > 0 {
                        
                        let mkPlaceMark = MKPlacemark(placemark: placemark[0])
                        let mapItem = MKMapItem(placemark: mkPlaceMark)
                        mapItem.name = self.chosenPlace
                        
                        let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
                        
                        mapItem.openInMaps(launchOptions: launchOptions)
                    }
                    
                }
            }
            
        }
    }
    
}
