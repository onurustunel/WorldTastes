//
//  saveLocationOnMapVC.swift
//  girisdeneme
//
//  Created by MEHMET ONUR ÜSTÜNEL on 31.03.2020.
//  Copyright © 2020 MEHMET ONUR ÜSTÜNEL. All rights reserved.
//  twitter.com/onur_ustunel

import UIKit
import MapKit
import CoreLocation

    // uploadVC 'den daha kolay erişebilmek için class dışarısında tanımladım. (Enlem ve boylam için)

    // I defined it outside the class (global) for easier access from uploadVC. (For latitude and longitude)

//----------------------------------------------------

    // çok doğru bir yöntem değil. Farklı alternatifler uygulanabilir. (singleton yapısı gibi)
//// It is not entirely correct method. Different alternatives can be applied. (like singleton structure)

    var clickedLatitude = ""
    var clickedLongitude = ""
    //class üzerinde tanımlama
    // defined global


class saveLocationOnMapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var chosenLatitude = Double()
    var chosenLongitude = Double()
  
    @IBOutlet weak var chosenLatitudeLabel: UILabel!
    @IBOutlet weak var chosenLongitudeLabel: UILabel!
    
    /*
     Önce mekanın konumunu haritada seçip ve sonraki ekrana ilerliyoruz.
     
     First, we select the location of the place on the map and proceed to the next screen.
     
     
     */
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        //Bunu Info.plist bölümünden de izin olarak eklemek gerekiyor.
        //It is necessary to add this as permission from the Info.plist section.
        
        locationManager.startUpdatingLocation()
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
        // Basılı tutmak için 2 saniye iyi bir süre.
        
        gestureRecognizer.minimumPressDuration = 2
        mapView.addGestureRecognizer(gestureRecognizer)
        
      
        //
    }
    // 49,840150, 24,018081
    
    @objc func chooseLocation(gestureRecognizer:UILongPressGestureRecognizer) {
        
        if gestureRecognizer.state == .began {
            
            let touchedPoint = gestureRecognizer.location(in: self.mapView)
            let touchedCoordinates = self.mapView.convert(touchedPoint, toCoordinateFrom: self.mapView)
            
            chosenLatitude = touchedCoordinates.latitude
            chosenLongitude = touchedCoordinates.longitude
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchedCoordinates
            annotation.title = "Add Place"
           // annotation.subtitle = commentText.text
            self.mapView.addAnnotation(annotation)
            
            /*
            
             Tıklanan noktaların enlem ve boylamını class üzerinde tanımlanan değişkenlere eşitledik. Böylece bütün verileri Firebase'ye kaydedebileceğiz.
 
 
 */
            /*
             We synchronized the latitude and longitude of the clicked points to the variables defined on the class. Thus, we will be able to save all the data to Firebase.
             
             */
            
            chosenLatitudeLabel.text = String("\(chosenLatitude)")
            chosenLongitudeLabel.text = String("\(chosenLongitude)")
            
            clickedLatitude = chosenLatitudeLabel.text!
            clickedLongitude = chosenLongitudeLabel.text!
      
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      
            let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
       
    }
    
    
    
    
    @IBAction func nextClicked(_ sender: Any) {
        performSegue(withIdentifier: "toUploadVC", sender: nil)
        
        
        
    }
    
    



}
