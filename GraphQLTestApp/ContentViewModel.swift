//
//  ContentViewModel.swift
//  GraphQLTestApp
//
//  Created by Elizeus Chrabrov on 02.11.2023.
//

import Foundation
import SpaceXAPI

final class ContentViewModel: ObservableObject {

    private let networkService: NetworkServiceProtocol

    @Published private(set) var rockets: [RocketQuery.Data.Rocket] = []

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
        self.fetchRockets()
    }

    // MARK: Methods
    func unwrapRocketValue<T>(_ value: T?) -> String {
        if let value {
            return "\(value)"
        } else {
            return "n/a"
        }
    }

    private func fetchRockets() {
        networkService.fetchRockets { [weak self] result in
            switch result {
            case .success(let data):
                self?.rockets = data
            case .failure(let error):
                debugPrint("⚠️", error.localizedDescription)
            }
        }
    }
}
