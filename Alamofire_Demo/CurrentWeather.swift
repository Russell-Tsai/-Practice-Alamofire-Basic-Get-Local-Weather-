//
//  CurrentWeather.swift
//  Alamofire_Demo
//
//  Created by APP Dimerco on 05/01/2018.
//  Copyright © 2018 APP Dimerco. All rights reserved.
//

import Foundation

class CurrentWeather {
    
    let temperature : Double?
    let humidity: Int?
    let precipProbability: Int?
    let summary : String?
    let icon: String?
    
    struct WeatherKeys {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipProbability = "precipProbability"
        static let summary = "summary"
        static let icon = "icon"
    }
    
    init(weatherDictionary: [String : Any]) {
        temperature = weatherDictionary[WeatherKeys.temperature] as? Double
        
        if let humidityDouble = weatherDictionary[WeatherKeys.humidity] as? Double {
            humidity = Int(humidityDouble * 100)
        }
        else{
            humidity = nil
        }
        
        if let precipDouble = weatherDictionary[WeatherKeys.precipProbability] as? Double {
            precipProbability = Int(precipDouble)
        }
        else{
            precipProbability = nil
        }
        
        summary = weatherDictionary[WeatherKeys.summary] as? String
        icon = weatherDictionary[WeatherKeys.icon] as? String
    }
    
    /*
     "currently": {
     "time": 1515140823,
     "summary": "Partly Cloudy",
     "icon": "partly-cloudy-night",
     "nearestStormDistance": 0,
     "precipIntensity": 0.003,
     "precipIntensityError": 0.001,
     "precipProbability": 0.49,
     "precipType": "rain",
     "temperature": 58.38,
     "apparentTemperature": 58.38,
     "dewPoint": 56.1,
     "humidity": 0.92,
     "pressure": 1020.07,
     "windSpeed": 4.21,
     "windGust": 9.31,
     "windBearing": 168,
     "cloudCover": 0.55,
     "uvIndex": 0,
     "visibility": 4.22,
     "ozone": 314.35
     },
     */
    
    
}
