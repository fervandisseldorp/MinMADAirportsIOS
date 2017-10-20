//
//  ViewController.swift
//  TestMapProject
//
//  Created by Ferdinand van Disseldorp on 20/10/2017.
//  Copyright © 2017 Ferdinand van Disseldorp. All rights reserved.
//
import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    var coordinateArray = [CLLocationCoordinate2D]()
    
    let BREDA_LONGLAT = CLLocation(latitude: 51.5719, longitude:4.7683);
    let CHURCHTOWN_LONGLAT = CLLocation(latitude: -43.5320, longitude:172.6362);
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        map.delegate = self
        drawLine()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawLine(){
        
        let startCoordinate = CLLocation(latitude: 51.5719, longitude: 4.7683)
        let endCoordinate = CLLocation(latitude: -43.5320, longitude: 172.6362)
        

        var array = [startCoordinate.coordinate, endCoordinate.coordinate]
        
        let polyline = MKPolyline(coordinates: array , count: 2)
        let geoline = MKGeodesicPolyline(coordinates: array, count: 2)
        

        map.add(geoline)
        
    }
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let polyline = overlay as? MKPolyline else {
            return MKOverlayRenderer()
        }
        
        let renderer = MKPolylineRenderer(polyline: polyline)
        renderer.lineWidth = 3.0
        renderer.alpha = 0.5
        renderer.strokeColor = UIColor.blue
        
        return renderer
    }


}

