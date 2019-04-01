//
//  ViewController.swift
//  MapDemo
//
//  Created by Panpan Han  on 2019/4/1.
//  Copyright © 2019 Panpan Han . All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    let coordinates = [Coordinate(latitude: 30.508293, longitude: 114.393533, title: "Opics Vally", subtitle: "Center of Wuhan"), Coordinate(latitude: 30.493520, longitude: 114.402842, title: "Poly Center", subtitle: "Enterprise center of Wuhan")]

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.mapView.delegate = self
        let regionCenter = CLLocationCoordinate2D(latitude: 30.508293, longitude: 114.393533)
        let region = MKCoordinateRegion(center: regionCenter, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        self.mapView.setRegion(region, animated: true)
        self.showPins()
    }

    private func showPins() {
        for coordinate in self.coordinates {
            let location = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
            let annotation = CustomPin(coordinate: location, title: coordinate.title, subtitle: coordinate.subtitle)
            self.mapView.addAnnotation(annotation)
        }
    }

    // Mark: MapView Delegate
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
        annotationView.image = UIImage(named: "pin")
        annotationView.canShowCallout = true
        return annotationView
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("annotation selected====", String(describing: view.annotation?.title))
    }
}

