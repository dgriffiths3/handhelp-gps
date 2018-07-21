//
//  MainMapViewController.swift
//  handheld-gps
//
//  Created by David Griffiths on 08/07/2018.
//  Copyright © 2018 David Griffiths. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var userLat: UILabel!
    @IBOutlet weak var userLon: UILabel!
    @IBOutlet weak var userAlt: UILabel!
    
    let locationManager = CLLocationManager()
    
    @IBAction func locateMeButton(_ sender: Any) {

        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.005, 0.005)
        
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(locationManager.location!.coordinate.latitude, locationManager.location!.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation = true
    }
    
    func zoomToCurrentLocation(){
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        //let span: MKCoordinateSpan = MKCoordinateSpanMake(0.001, 0.001)
        //let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        //let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        //mapView.setRegion(region, animated: true)
        
        userLat.text = String((location.coordinate.latitude*1000).rounded()/1000)
        userLon.text = String((location.coordinate.longitude*1000).rounded()/1000)
        userAlt.text = String((location.altitude*100).rounded()/100) + String(" m")
        
        self.mapView.showsUserLocation = true
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
