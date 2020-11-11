//
//  ConnectionError.swift
//  iOS-Eliq-Challenge
//
//  Created by Amir on 11/8/20.
//

public protocol ConnectionError: Error {
    var isInternetConnectionError: Bool { get }
}

public extension Error {
    var isInternetConnectionError: Bool {
        guard let error = self as? ConnectionError, error.isInternetConnectionError else {
            return false
        }
        return true
    }
}
