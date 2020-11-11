//
//  DefaultCurrencyListRepository.swift
//  iOS-Eliq-Challenge
//
//  Created by Amir on 11/11/20.
//

import UIKit

final class DefaultCurrencyListRepository
{
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
}
extension DefaultCurrencyListRepository: CurrencyListRepository {
    func currentCurrencies(base: String, completion: @escaping (Result<CurrencyList, Error>) -> Void) -> Cancellable? {
        let endpoint = APIEndpoints.currencyList(base: base)
        let networkTask = self.dataTransferService.request(with: endpoint, completion: completion)
        return RepositoryTask(networkTask: networkTask)

    }
}
