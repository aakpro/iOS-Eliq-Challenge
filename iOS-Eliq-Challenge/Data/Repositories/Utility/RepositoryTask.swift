//
//  RepositoryTask.swift
//  iOS-Eliq-Challenge
//
//  Created by Amir on 11/11/20.
//

struct RepositoryTask: Cancellable {
    let networkTask: NetworkCancellable?
    func cancel() {
        networkTask?.cancel()
    }
}
