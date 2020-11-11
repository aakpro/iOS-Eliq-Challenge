//
//  NetworkTests.swift
//  iOS-Eliq-ChallengeTests
//
//  Created by Amir on 11/11/20.
//

import XCTest
@testable import iOS_Eliq_Challenge

class NetworkTests: XCTestCase {
    private var dataTransferService: DataTransferService!
    private let appConfigurations = AppConfigurations()
    private let endpoint = APIEndpoints.currencyList()
    override func setUpWithError() throws {
        let config = ApiDataNetworkConfig(baseURL: URL(string: appConfigurations.apiBaseURL)!,
                                          queryParameters: ["access_key": appConfigurations.accessKey])
        let apiDataNetwork = DefaultNetworkService(session: URLSession.shared,
                                                   config: config)
        dataTransferService =  DefaultDataTransferService(with: apiDataNetwork)
    }

    func testFetchCurrentCurrencies() throws {
        let expectation = self.expectation(description: "Test current currency api")
        dataTransferService.request(with: endpoint) { (result) in
            switch result{
            case .success(let response):
                XCTAssertNotNil(response.rates, "rate are nil")
                expectation.fulfill()
                break;
            case .failure(let error):
                XCTAssertNil(error, error.localizedDescription)
                break;
            }
        }
        waitForExpectations(timeout: 10.0) { error in
            XCTAssertNil(error, error?.localizedDescription ?? "")
        }
    }
}
