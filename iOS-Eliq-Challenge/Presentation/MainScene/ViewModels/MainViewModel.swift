//
//  MainViewModel.swift
//  iOS-Eliq-Challenge
//
//  Created by Amir on 11/9/20.
//

import UIKit

protocol MainViewModelInput {
    var rates: Observable<Dictionary<Currencies, Double>> { get }
    var errorMessage: Observable<String> { get }
    func updateData()
}

protocol MainViewModelOutput {
}

protocol MainViewModel: MainViewModelInput, MainViewModelOutput
{
}

final class DefaultMainViewModel: MainViewModel
{
    var rates: Observable<Dictionary<Currencies, Double>> = Observable([:])
    var errorMessage: Observable<String> = Observable("")
    
    struct Dependency {
        let usecase: FetchCurrencyDataUseCase
    }
    private let dependency: Dependency
    init(dependency: Dependency) {
        self.dependency = dependency
        fetchCurrencies()
    }
    
    func fetchCurrencies(base: Currencies = .eUR) {
        let _ = dependency.usecase.execute(requestValue: FetchCurrencyDataUseCaseRequestValue(baseCurrency: base)) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.rates.value = response.rates ?? [:]
            case .failure(let error):
                self.show(error)
            }
        }
    }
    
    func show(_ error: Error) {
        errorMessage.value = error.localizedDescription
    }
    func updateData() {
        fetchCurrencies()
    }
}
