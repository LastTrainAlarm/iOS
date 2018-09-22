//
//  NMapTestVC.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 21..
//  Copyright © 2018년 양어진. All rights reserved.
//

import UIKit

class NMapVC: UIViewController, NMapViewDelegate, NMapPOIdataOverlayDelegate {
    
    
    var mapView: NMapView?  //객체생성.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = NMapView(frame: self.view.frame)
        self.navigationController?.navigationBar.isTranslucent = false
        
        if let mapView = mapView {
            // set the delegate for map view
            mapView.delegate = self
            
            // set the application api key for Open MapViewer Library
            //클라이언트 아이디 설정
            mapView.setClientId("14Us5m6zaKXZ4yWmXQ8m")
            mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.addSubview(mapView)
            mapView.mapViewTrafficMode = false //실시간 교통지도
        }
        
        
        
        
        //현재 위치 표시하기 및 지도 회전-------------------------------
        /*
        if let lm = NMapLocationManager.getSharedInstance() {
            // set delegate
            lm.setDelegate(self)
            
            // start updating location
            lm.startContinuousLocationInfo()
            
            mapView?.setAutoRotateEnabled(true, animate: true)
            
            // start updating heading
            lm.startUpdatingHeading()
        }
         */
        //-----------------------------------------------------
        
    }
    
    public func onMapView(_ mapView: NMapView!, initHandler error: NMapError!) {
        if (error == nil) { // success
            
            
            // set map center and level
            mapView.setMapCenter(NGeoPoint(longitude:126.978371, latitude:37.5666091), atLevel:11)
            
            // set for retina display
            mapView.setMapEnlarged(true, mapHD: true)
        } else { // fail
            print("onMapView:initHandler: \(error.description)")
        }
    }
    
    open func onMapOverlay(_ poiDataOverlay: NMapPOIdataOverlay!, imageForOverlayItem poiItem: NMapPOIitem!, selected: Bool) -> UIImage! {
        
        return NMapViewResources.imageWithType(poiItem.poiFlagType, selected: selected)
        
    }
    
    open func onMapOverlay(_ poiDataOverlay: NMapPOIdataOverlay!, anchorPointWithType poiFlagType: NMapPOIflagType) -> CGPoint {
        
        return NMapViewResources.anchorPoint(withType: poiFlagType)
        
    }
    
    open func onMapOverlay(_ poiDataOverlay: NMapPOIdataOverlay!, calloutOffsetWithType poiFlagType: NMapPOIflagType) -> CGPoint {
        
        return CGPoint(x: 0, y: 0)
        
    }
    
    open func onMapOverlay(_ poiDataOverlay: NMapPOIdataOverlay!, imageForCalloutOverlayItem poiItem: NMapPOIitem!, constraintSize: CGSize, selected: Bool, imageForCalloutRightAccessory: UIImage!, calloutPosition: UnsafeMutablePointer<CGPoint>!, calloutHit calloutHitRect: UnsafeMutablePointer<CGRect>!) -> UIImage! {
        
        return nil
        
    }
    
}





