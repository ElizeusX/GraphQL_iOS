//
//  GraphQLTestAppApp.swift
//  GraphQLTestApp
//
//  Created by Elizeus Chrabrov on 02.11.2023.
//

import SwiftUI

@main
struct GraphQLTestAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                viewModel: ContentViewModel(
                    networkService: NetworkService()
                )
            )
        }
    }
}
