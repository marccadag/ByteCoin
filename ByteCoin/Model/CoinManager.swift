//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Marc Cadag on 10/23/21.
//

import Foundation

protocol CoinManagerDelegate: AnyObject {
    func didUpdatePrice(coin: CoinData, currency: Currency)
    func didFailWithError(error: Error)
}

class CoinManager: NetworkManager {
    weak var delegate: CoinManagerDelegate?
    
    let currencyArray = Currency.allCases
    
    private let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    private let apiKey = "729CCA02-6F43-4EC3-B0CE-FAABF0A52E47"
    
    func getCoinPrice(for currency: Currency){
        let urlString = "\(baseURL)/\(currency.rawValue)?apikey=\(apiKey)"
        
        fetchData(urlString: urlString, CoinData.self) { coinData in
            self.delegate?.didUpdatePrice(coin: coinData, currency: currency)
        } onError: { error in
            self.delegate?.didFailWithError(error: error)
        }
    }
}
