//
//  MainSceneDIContainer.swift
//  iOS-Eliq-Challenge
//
//  Created by Amir on 11/9/20.
//

import UIKit

final class MainSceneDIContainer: NSObject {
    struct Dependency {
        let dataTransferService: DataTransferService
        
    }
    let dependency: Dependency
    init(dependency: Dependency) {
        self.dependency = dependency
    }
    //MARK: - ViewController
    func makeMainViewController() -> MainViewController {
        return MainViewController.create(with: makeMainViewModel())
    }
    //MARK: - ViewModel
    private func makeMainViewModel() -> MainViewModel {
        return DefaultMainViewModel(dependency: DefaultMainViewModel.Dependency(usecase: makeFetchCurrencyDataUseCase()))
    }
    //MARK: - Usecase
    private func makeFetchCurrencyDataUseCase() -> FetchCurrencyDataUseCase{
        return DefaultFetchCurrencyDataUseCase(repository: makeCurrencyListRepository())
    }
    //MARK: - Repository
    private func makeCurrencyListRepository() -> CurrencyListRepository {
        return DefaultCurrencyListRepository(dataTransferService: dependency.dataTransferService)
    }
}
