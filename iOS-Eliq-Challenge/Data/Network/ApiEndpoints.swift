//
//  ApiEndpoints.swift
//  iOS-Eliq-Challenge
//
//  Created by Amir on 11/11/20.
//

import UIKit

struct APIEndpoints {
    static func currencyList(base: String = Currencies.eUR.rawValue) -> Endpoint<CurrencyList> {
        return Endpoint(path: "latest", queryParameters: ["base": base])
    }
}
