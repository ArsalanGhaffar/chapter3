//
//  MapController.swift
//  ch3nerdwrench
//
//  Created by Arsalan on 3/15/16.
//  Copyright © 2016 Arsalan. All rights reserved.
//

import Foundation
import UIKit
import MapKit


 class MapController:UIViewController {

    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(true)
//        
//        let obj1 = ConversionViewController()
//        let x = obj1.timecomparision()
//        
//        if x >= 12 {
//            view.backgroundColor = UIColor.blueColor()       }
//        
//    }


    
    var mapview : MKMapView!
    
    override func loadView() {
       // create a map view
        mapview = MKMapView()
        // set mapview to this view
        view = mapview
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         print("mapcontroller loaded to its view")
    }
    




}