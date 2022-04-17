//
//  WeatherManager.swift
//  Clima
//
//  Created by Richard Huynh on 4/17/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

class WeatherManager {
    let weatherURL =  "https://api.openweathermap.org/data/2.5/weather?appid=24ae4a9256c3609ee3bc883fff0e7251&units=imperial"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString)  {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error: ))
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
