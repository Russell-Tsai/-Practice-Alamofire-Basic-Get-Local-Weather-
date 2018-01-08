//
//  NetWorkingService.swift
//  Alamofire_Demo
//
//  Created by APP Dimerco on 05/01/2018.
//  Copyright © 2018 APP Dimerco. All rights reserved.
//

import Foundation
import Alamofire

class NetWorkingService {
    
//    let url = URL(string: "https://api.darksky.net/forecast/42dd4ba446f577acc07bd5769cb00ef9/37.8267,-122.4233")
    
    let forecastAPIKey : String
    let forecastBaseURL: URL?
    
    init(APIKey: String){
        self.forecastAPIKey = APIKey
        self.forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    
    func getCurrentWeather(latitude: Double, longtitude: Double, complition: @escaping (CurrentWeather?) -> Void){
        if let forcastURL = URL(string: "\(forecastBaseURL!)/\(latitude),\(longtitude)"){
            Alamofire.request(forcastURL).responseJSON(completionHandler: { (response) in
                if let jsonDictionary = response.result.value as? [String : Any] {
                    if let currentWeatherDictionary = jsonDictionary["currently"] as? [String:Any] {
                        let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
                        complition(currentWeather)
                    }
                    else{
                        complition(nil)
                    }
                }
            })

        }
    }
    
    
}
