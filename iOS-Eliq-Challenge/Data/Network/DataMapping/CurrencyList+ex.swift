//
//  CurrencyList.swift
//  iOS-Eliq-Challenge
//
//  Created by Amir on 11/11/20.
//

import UIKit

extension CurrencyList : Decodable {
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case timestamp = "timestamp"
        case base = "base"
        case date = "date"
        case ratesDict = "rates"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        timestamp = try values.decodeIfPresent(Int.self, forKey: .timestamp)
        base = try values.decodeIfPresent(String.self, forKey: .base)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        ratesDict = try values.decodeIfPresent([String: Double].self, forKey: .ratesDict)
        rates = Dictionary<Currencies, Double>()
        ratesDict?.forEach({ (key, value) in
            guard let currency = Currencies(rawValue: key) else { return }
            rates?[currency] = value
        })
        
    }
}
