//
//  NetworkService.swift
//  GraphQLTestApp
//
//  Created by Elizeus Chrabrov on 14.11.2023.
//

import Foundation
import Apollo
import SpaceXAPI

protocol NetworkServiceProtocol {
    func fetchRockets(completionHandler: @escaping (Result<[RocketQuery.Data.Rocket], Error>) -> Void)
}

final class NetworkService {

    private lazy var apolloClient: ApolloClient = {
        guard let url = URL(string: "https://spacex-production.up.railway.app/") else {
            preconditionFailure("url must exist")
        }
        return ApolloClient(url: url)
    }()
    private let rocketsQuery = RocketQuery()
}

// MARK: - Protocol
extension NetworkService: NetworkServiceProtocol {

    func fetchRockets(completionHandler: @escaping (Result<[RocketQuery.Data.Rocket], Error>) -> Void) {
        apolloClient.fetch(query: rocketsQuery) { result in
            switch result {
            case .success(let value):
                let rockets = value.data?.rockets?.compactMap { $0 } ?? []
                completionHandler(.success(rockets))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
