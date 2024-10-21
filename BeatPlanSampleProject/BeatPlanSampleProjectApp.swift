//
//  BeatPlanSampleProjectApp.swift
//  BeatPlanSampleProject
//
//  Created by Mayur Tyagi on 01/10/24.
//

import SwiftUI

@main
struct BeatPlanSampleProjectApp: App {
    @State private var isFreshBeat: Bool = true
    var body: some Scene {
        WindowGroup {
            NavigationStack{
//                BeatListView(viewModel: BeatListView.ViewModel(beatCDHelperObj: BeatCDHelper.shared))
                CreateBeatView(viewModel: CreateBeatView.ViewModel(beatCDHelperObj: BeatCDHelper.shared))
            }
        }
    }
}
