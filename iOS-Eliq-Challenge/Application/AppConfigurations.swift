//
//  AppConfigurations.swift
//  iOS-Eliq-Challenge
//
//  Created by Amir on 11/8/20.
//
import Foundation
/// Get basic configuration which are embeded in project settings
final class AppConfigurations: NSObject
{
    lazy var accessKey: String = {
        guard let accessKey = Bundle.main.object(forInfoDictionaryKey: "AccessKey") as? String else {
            fatalError("Access Key must not be empty in plist")
        }
        return accessKey
    }()
    
    lazy var apiBaseURL: String = {
        guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String else {
            fatalError("Api Base URL must not be empty in plist")
        }
        return apiBaseURL
    }()
}
