//
//  NearStartTableCell1.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 21..
//  Copyright © 2018년 양어진. All rights reserved.
//

import UIKit
import MapKit

class NearStartTableCell1: UITableViewCell {
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        let lat = 37.451551
        let long = 127.159817
        
        let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let annotaion = MKPointAnnotation()
        annotaion.coordinate = location
        annotaion.title = "남한산성입구역"
        annotaion.subtitle = "8호선"
        
        let location2 = CLLocationCoordinate2D(latitude: 37.456798, longitude: 127.150057)
        let annotaion2 = MKPointAnnotation()
        annotaion2.coordinate = location2
        annotaion2.title = "산성역"
        annotaion2.subtitle = "8호선"
        
        
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location, span: span)
        
        //let region2 = MKCoordinateRegion(center: location2, span: span)
        
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotaion)
        
        // mapView.setRegion(region2, animated: true)
       // mapView.addAnnotation(annotaion2)

        locationManager.requestWhenInUseAuthorization()

        mapView.showsUserLocation = true

        
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
