//
//  FishDetailsView.swift
//  Guia Animal Crossing New Horizons
//
//  Created by Maria Lozano Ovejero on 29/10/25.
//

import SwiftUI

struct FishDetailsView: BaseView {
    @StateObject var viewModel: FishesViewModel
        
    let fish: FishModel
    
    var body: some View {
        ACDetailsTemplate(model: viewModel.modelView.collectionItems[0])
    }
}



#Preview {
    FishDetailsView(
        viewModel: FishesViewModel(),
        fish: FishModel.mock1
    )
}
