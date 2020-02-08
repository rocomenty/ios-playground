//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoinData(coinManager: CoinManager, quote: Double)
    func didFailWithError(coinManager: CoinManager, error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "17242F60-976B-4CAB-8AD0-B1AA141F533C"
    let currencyArray = ["EUR", "GBP", "HKD", "JPY", "RMB", "USD"]
    
    func getCoinPrice(for currency: String) {
        let urlString = baseURL + "/\(currency)"
        self.performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            var request = URLRequest(url: url)
            request.addValue(apiKey, forHTTPHeaderField: "X-CoinAPI-Key")
            let task = session.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(coinManager: self, error: error!)
                    return
                }
                if let safeData = data {
                    if let quote = self.parseJSON(with: safeData) {
                        self.delegate?.didUpdateCoinData(coinManager: self, quote: quote)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(with data: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let rate = decodedData.rate
            return rate
        } catch {
            self.delegate?.didFailWithError(coinManager: self, error: error)
            return nil
        }
    }
}
