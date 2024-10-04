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
                if isFreshBeat{
                    CreateBeatView(viewModel: CreateBeatView.ViewModel(beatName: ""))
                }else{
                    CreateBeatView(viewModel: CreateBeatView.ViewModel(beatName: "Beat Name"))
                }
            }
        }
    }
}
