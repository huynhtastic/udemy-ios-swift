//
//  CoinData.swift
//  ByteCoin
//
//  Created by Richard Huynh on 4/21/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
    
}
