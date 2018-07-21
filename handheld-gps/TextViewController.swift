//
//  TextViewController.swift
//  handheld-gps
//
//  Created by David Griffiths on 21/07/2018.
//  Copyright © 2018 David Griffiths. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class TextViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var userLat: UILabel!
    @IBOutlet weak var userLon: UILabel!
    @IBOutlet weak var userAlt: UILabel!
    @IBOutlet weak var twoDQC: UILabel!
    @IBOutlet weak var threeDQC: UILabel!
    
    
    let locationManager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        userLat.text = String((location.coordinate.latitude*10000).rounded()/10000)
        userLon.text = String((location.coordinate.longitude*10000).rounded()/10000)
        userAlt.text = String((location.altitude*100).rounded()/100)
        twoDQC.text = String((location.horizontalAccuracy*1000).rounded()/1000)+String(" m")
        threeDQC.text = String((location.verticalAccuracy*1000).rounded()/1000)+String(" m")
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
