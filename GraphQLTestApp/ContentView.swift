//
//  ContentView.swift
//  GraphQLTestApp
//
//  Created by Elizeus Chrabrov on 02.11.2023.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel: ContentViewModel

    // MARK: Init
    init(viewModel: ContentViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    // MARK: Body
    var body: some View {
        VStack(alignment: .leading) {
            Text("Rockets:")
                .font(.title)
                .bold()
                .padding(.horizontal, 16)
            List(viewModel.rockets, id: \.id) { rocket in
                if let rocketName = rocket.name {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(rocketName)
                            .font(.title3)
                        HStack(spacing: 15) {
                            Text("Height: \(viewModel.unwrapRocketValue(rocket.height?.meters)) m")
                            Text("Weight: \(viewModel.unwrapRocketValue(rocket.mass?.kg)) kg")
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView(
        viewModel: ContentViewModel(
            networkService: NetworkService()
        )
    )
}
