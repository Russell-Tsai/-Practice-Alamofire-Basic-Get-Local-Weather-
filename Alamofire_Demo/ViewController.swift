//
//  ViewController.swift
//  Alamofire_Demo
//
//  Created by APP Dimerco on 05/01/2018.
//  Copyright © 2018 APP Dimerco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let forecastAPIKey = "42dd4ba446f577acc07bd5769cb00ef9"
    let coordinate: (lat : Double, long: Double) = (25.044955,121.335579)
    var forecastService : NetWorkingService!

    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forecastService = NetWorkingService(APIKey: forecastAPIKey)
        forecastService.getCurrentWeather(latitude: coordinate.lat, longtitude: coordinate.long) { (currentWeather) in
            if let myCurrentWeather = currentWeather {
                if let temperature = myCurrentWeather.temperature {
                    self.temperatureLabel.text = "\(temperature)°"
                }
                else{
                    self.temperatureLabel.text = "-"
                }
            }
            
        }
        
        
    }
}

