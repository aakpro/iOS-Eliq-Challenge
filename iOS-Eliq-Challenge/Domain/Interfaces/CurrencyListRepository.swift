//
//  CurrencyListRepository.swift
//  iOS-Eliq-Challenge
//
//  Created by Amir on 11/11/20.
//

import UIKit

protocol CurrencyListRepository {
    func currentCurrencies(base: String, completion: @escaping (Result<CurrencyList, Error>) -> Void) -> Cancellable?
}
