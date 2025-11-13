//
//  BugsDetailsView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 31/10/25.
//

import SwiftUI

struct BugsDetailsView: BaseView {
    @StateObject var viewModel: BugDetailViewModel
    
    var body: some View {
        ACDetailsTemplate(model: viewModel.modelView)
    }
}

#Preview {
    BugsDetailsView(
        viewModel: BugDetailViewModel(modelView: .mock1)
    )
}
