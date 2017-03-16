//
//  denverMapViewController.swift
//  Security App
//
//  Created by Osowski, Emily, Vodafone Americas on 3/16/17.
//  Copyright © 2017 emilyosowski. All rights reserved.
//
import UIKit
import MapKit

class denverMapViewViewController: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    //    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    //    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    
    var weather = denverWeatherDataModel()
    
    let regionRadius: CLLocationDistance = 2000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.parent?.title = "PocketSoc"
        
        let initialLocation = CLLocation(latitude: 39.749121, longitude: -104.991165)
        centerMapOnLocation(initialLocation)
        
        mapView.delegate = self
        
        let location = Location(title: "Vodafone Denver",
                                locationName: "999 18th Street, Suite 1750",
                                discipline: "Office",
                                coordinate: CLLocationCoordinate2D(latitude: 39.749121, longitude: -104.991165))
        
        
        mapView.addAnnotation(location)
        
        let yourAnnotationAtIndex = 0
        mapView.selectAnnotation(mapView.annotations[yourAnnotationAtIndex], animated: true)
        //automatically displays annotation info without tap
        
        weather.downloadData {
            self.updateUI()
        }
        
        
        
        
        
        
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //        self.tabBarController?.tabBar.tintColor = UIColor.black
    //    }
    
    
    func mapView(_ mapView: MKMapView,
                 viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Location {
            let identifier = "artPin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            
            return view
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Location
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
    
    
    func centerMapOnLocation(_ location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func updateUI() {
        //        dateLabel.text = weather.date
        tempLabel.text = "\(weather.temp)"
        locationLabel.text = weather.location
        weatherLabel.text = weather.weather
        //        weatherImage.image = UIImage(named: weather.weather)
    }
    
    
}
