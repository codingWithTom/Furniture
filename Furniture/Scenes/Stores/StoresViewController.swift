//
//  StoresViewController.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-27.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import UIKit
import MapKit

class StoresViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
  private let viewModel = StoresViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureMapView()
  }
}

private extension StoresViewController {
  func configureMapView() {
    mapView.delegate = self
    mapView.addAnnotations(viewModel.getStores())
    let center = CLLocationCoordinate2D(latitude: 37.7890292, longitude: -122.4124627)
    let startingCamera = MKMapCamera(lookingAtCenter: center,
                                    fromEyeCoordinate: center,
                                    eyeAltitude: 2000)
    mapView.setCamera(startingCamera, animated: true)
  }
}

extension StoresViewController: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    guard let storeAnnotation = annotation as? StoreAnnotationViewModel else { return MKPinAnnotationView() }
    let marker = MKMarkerAnnotationView()
    marker.markerTintColor = storeAnnotation.isOpen ? .blue : .gray
    let nameLabel = UILabel()
    nameLabel.text = storeAnnotation.name
    marker.detailCalloutAccessoryView = nameLabel
    let button = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0))
    button.setImage(UIImage(systemName: storeAnnotation.isOpen ? "phone.fill.arrow.up.right" : "questionmark.circle"), for: .normal)
    marker.rightCalloutAccessoryView = button
    marker.canShowCallout = true
    return marker
  }
  
  func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
    guard let storeAnnotation = view.annotation as? StoreAnnotationViewModel else { return }
    viewModel.tappedCallout(on: storeAnnotation)
  }
}

extension StoreAnnotationViewModel: MKAnnotation {
  var coordinate: CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}
