//
//  WeatherManager.swift
//  Clima
//
//  Created by Richard Huynh on 4/17/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

class WeatherManager {
    let weatherURL =  "https://api.openweathermap.org/data/2.5/weather?appid=24ae4a9256c3609ee3bc883fff0e7251&units=imperial"
    
    var delegate: WeatherManagerDelegate?
    
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
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            return weather;
        } catch {
            print(error)
            return nil
        }
    }
    
}
