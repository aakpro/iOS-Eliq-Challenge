//
//  FetchCurrencyDataUseCase.swift
//  iOS-Eliq-Challenge
//
//  Created by Amir on 11/11/20.
//

import UIKit

protocol FetchCurrencyDataUseCase
{
    func execute(requestValue: FetchCurrencyDataUseCaseRequestValue?,
                 completion: @escaping (Result<CurrencyList, Error>) -> Void) -> Cancellable?
}

final class DefaultFetchCurrencyDataUseCase: FetchCurrencyDataUseCase
{
    private let repository: CurrencyListRepository
    init(repository: CurrencyListRepository) {
        self.repository = repository
    }
    func execute(requestValue: FetchCurrencyDataUseCaseRequestValue? = nil, completion: @escaping (Result<CurrencyList, Error>) -> Void) -> Cancellable? {
        return repository.currentCurrencies(base: (requestValue?.baseCurrency ?? Currencies.eUR).rawValue, completion: completion)
    }
}

struct FetchCurrencyDataUseCaseRequestValue {
    let baseCurrency: Currencies
    
}
