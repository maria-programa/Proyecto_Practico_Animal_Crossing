//
//  LayoutExample.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 16/12/25.
//

import SwiftUI

struct LayoutExample: View {
//    @Environment(\.horizontalSizeClass) var horizontalSizeClass
//
//        var body: some View {
//            if horizontalSizeClass == .compact {
//                Text("Compact")
//            } else {
//                Text("Regular")
//            }
//        }
    var body: some View {
            ScrollView {
                let columns = [GridItem(.adaptive(minimum: 80))]
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(1...100, id: \.self) { index in
                        VStack {
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text("Image \(index)")
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                    }
                }
                .padding(.horizontal)
            }
        }
}

#Preview {
    LayoutExample()
}
