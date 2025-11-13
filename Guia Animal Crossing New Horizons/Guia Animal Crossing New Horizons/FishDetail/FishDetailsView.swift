//
//  FishDetailsView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 29/10/25.
//

import SwiftUI

struct FishDetailsView: BaseView {
    @StateObject var viewModel: FishDetailViewModel
        
//    let fish: FishModel
    
    var body: some View {
        ACDetailsTemplate(model: viewModel.modelView)
    }
}



#Preview {
    FishDetailsView(
        viewModel: FishDetailViewModel(modelView: .mock1)
    )
}
