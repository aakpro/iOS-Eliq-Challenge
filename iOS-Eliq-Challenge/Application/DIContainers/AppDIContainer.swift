//
//  AppDIContainer.swift
//  iOS-Eliq-Challenge
//
//  Created by Amir on 11/9/20.
//

import UIKit

class AppDIContainer: NSObject {
    lazy var appConfigurations = AppConfigurations()
    
    // MARK: - Network
    lazy var apiDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(baseURL: URL(string: appConfigurations.apiBaseURL)!,
                                          queryParameters: ["access_key": appConfigurations.accessKey])

        let apiDataNetwork = DefaultNetworkService(session: URLSession.shared,
                                                   config: config)
        return DefaultDataTransferService(with: apiDataNetwork)
    }()

    
    func makeMainSceneDIContainer() -> MainSceneDIContainer {
        return MainSceneDIContainer(
            dependency: MainSceneDIContainer.Dependency(dataTransferService: self.apiDataTransferService))
    }

}
