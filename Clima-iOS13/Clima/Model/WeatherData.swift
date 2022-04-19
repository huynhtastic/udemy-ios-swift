//
//  WeatherData.swift
//  Clima
//
//  Created by Richard Huynh on 4/18/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable{
    let name: String
    let weather: [Weather]
    let main: Main
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
}
