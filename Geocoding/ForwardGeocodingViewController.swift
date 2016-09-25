//
//  ForwardGeocodingViewController.swift
//  Geocoding
//
//  Created by Bart Jacobs on 25/09/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class ForwardGeocodingViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet var countryTextField: UITextField!
    @IBOutlet var streetTextField: UITextField!
    @IBOutlet var cityTextField: UITextField!

    @IBOutlet var geocodeButton: UIButton!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!

    @IBOutlet var locationLabel: UILabel!

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction func geocode(_ sender: UIButton) {
        
    }

}
