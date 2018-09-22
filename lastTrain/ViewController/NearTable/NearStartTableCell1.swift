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
        
        let location = CLLocationCoordinate2D(latitude: 37.452206, longitude: 127.156500)
        
        let annotaion = MKPointAnnotation()
        annotaion.coordinate = location
        annotaion.title = "현재 위치입니댱"
        annotaion.subtitle = "자취방"
        
        
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotaion)
        
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
