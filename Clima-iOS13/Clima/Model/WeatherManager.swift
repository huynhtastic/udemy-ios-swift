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
            let task = session.dataTask(with: url) { (data, response, error ) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather[0].description)
        } catch {
            print(error)
        }
    }
    
}
