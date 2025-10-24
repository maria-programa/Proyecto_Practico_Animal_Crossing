//
//  DynamicPathView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 24/10/25.
//

import SwiftUI

struct DynamicPathView: View {
    @State private var path = NavigationPath()

        var body: some View {
            NavigationStack(path: $path) {
                VStack {
                    Button("Go to Screen A") {
                        path.append("Screen A")
                    }
                    Button("Go to Screen B") {
                        path.append("Screen B")
                    }
                }
                .navigationDestination(for: String.self) { value in
                    if value == "Screen A" {
                        Text("Welcome to Screen A")
                    } else if value == "Screen B" {
                        Text("Welcome to Screen B")
                    }
                }
            }
        }
}

#Preview {
    DynamicPathView()
}
