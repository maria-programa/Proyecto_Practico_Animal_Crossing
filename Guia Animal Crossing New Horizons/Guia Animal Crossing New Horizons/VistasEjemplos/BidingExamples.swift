//
//  BidingExamples.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 23/10/25.
//

import SwiftUI

struct BidingExamples: View {
    @State var number: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                titleView
                countButton
            }
            descriptionView
            resetButton
        }
    }
    
    var titleView: some View {
        Text("Tuna")
            .font(.title)
    }
    
    var countButton: some View {
        CountCard(number: $number)
    }
    
    var descriptionView: some View {
        Text("JSsjdgkwd dhqkd gduw dywydwldh owdhwodwdl wjdqidiwd wldlqenwdbwkudkwl a,djkdwqidwd bfkkyfpwe ")
            .font(.body)
    }
    
    var resetButton: some View {
        Button {
            number = 0
        } label: {
            Text("Reset")
        }
        .buttonStyle(.borderedProminent)
        .tint(.red)
    }
    
    
    
}

struct CountCard: View {
    @Binding var number: Int
    
    var body: some View {
        Button {
            number += 1
        } label: {
            cardLabel
        }

    }
    
    var cardLabel: some View {
        HStack {
            Text("Count: \(number)")
                .foregroundStyle(.black)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
        }
    }
    
}

#Preview {
    BidingExamples()
}
