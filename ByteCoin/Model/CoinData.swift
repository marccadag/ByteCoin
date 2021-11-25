//
//  CoinData.swift
//  ByteCoin
//
//  Created by Marc Cadag on 10/23/21.
//

import Foundation

struct CoinData: Decodable {
    let rate: Double
    
    var rateString: String {
        String(format: "%.2f", rate)
    }
}
