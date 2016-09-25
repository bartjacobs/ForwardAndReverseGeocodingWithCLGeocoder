//
//  ForwardGeocodingViewController.swift
//  Geocoding
//
//  Created by Bart Jacobs on 25/09/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit
import CoreLocation

class ForwardGeocodingViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet var countryTextField: UITextField!
    @IBOutlet var streetTextField: UITextField!
    @IBOutlet var cityTextField: UITextField!

    @IBOutlet var geocodeButton: UIButton!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!

    @IBOutlet var locationLabel: UILabel!

    // MARK: -

    lazy var geocoder = CLGeocoder()

    // MARK: - Initialization

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        title = "Forward Geocoding"
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction func geocode(_ sender: UIButton) {
        guard let country = countryTextField.text else { return }
        guard let street = streetTextField.text else { return }
        guard let city = cityTextField.text else { return }

        // Create Address String
        let address = "\(country), \(city), \(street)"

        // Geocode Address String
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            // Process Response
            self.processResponse(withPlacemarks: placemarks, error: error)
        }

        // Update View
        geocodeButton.isHidden = true
        activityIndicatorView.startAnimating()
    }

    // MARK: - Helper Methods

    private func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
        // Update View
        geocodeButton.isHidden = false
        activityIndicatorView.stopAnimating()

        if let error = error {
            print("Unable to Forward Geocode Address (\(error))")
            locationLabel.text = "Unable to Find Location for Address"

        } else {
            var location: CLLocation?
            
            if let placemarks = placemarks, placemarks.count > 0 {
                location = placemarks.first?.location
            }

            if let location = location {
                let coordinate = location.coordinate
                locationLabel.text = "\(coordinate.latitude), \(coordinate.longitude)"
            } else {
                locationLabel.text = "No Matching Location Found"
            }
        }
    }

}
