//
//  BeatPlanSampleProjectApp.swift
//  BeatPlanSampleProject
//
//  Created by Mayur Tyagi on 01/10/24.
//

import SwiftUI

@main
struct BeatPlanSampleProjectApp: App {
    var body: some Scene {
        WindowGroup {
            CreateBeatView(viewModel: CreateBeatView.ViewModel())
        }
    }
}
