//
//  AddLocationViewModel.swift
//  BeatPlanSampleProject
//
//  Created by Mayur Tyagi on 09/10/24.
//

import SwiftUI

extension AddLocationView {
    class ViewModel: ObservableObject{
        @Published var locations: [Visit] = []
        
        init(locations: [Visit]) {
            self.locations = locations
        }
        
    }
}

