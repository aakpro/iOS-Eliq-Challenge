//
//  CurrenciesList.swift
//  iOS-Eliq-Challenge
//
//  Created by Amir on 11/11/20.
//

import Foundation
struct CurrencyList {
    let success : Bool?
    let timestamp : Int?
    let base : String?
    let date : String?
    let rates: Dictionary<Currencies, Double>?
}
