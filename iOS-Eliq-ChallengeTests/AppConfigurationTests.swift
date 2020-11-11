//
//  iOS_Eliq_ChallengeTests.swift
//  iOS-Eliq-ChallengeTests
//
//  Created by Amir on 11/8/20.
//

import XCTest
@testable import iOS_Eliq_Challenge

class AppConfigurationTests: XCTestCase {
    var appConfig:AppConfigurations!
    override func setUpWithError() throws {
        appConfig = AppConfigurations()
    }

    func testApiBaseURL() {
        XCTAssertNotNil(appConfig.apiBaseURL, "Api Base URL is nil")
        XCTAssertNotNil(URL(string: appConfig.apiBaseURL), "Api Base URL cannot be URL")
    }
    func testAccessKey() {
        XCTAssertNotNil(appConfig.accessKey, "Access Key is nil")
    }
}
