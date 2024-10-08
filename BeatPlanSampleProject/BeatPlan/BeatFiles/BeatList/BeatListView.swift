//
//  BeatView.swift
//  senseStaff
//
//  Created by Mayur  on 24/09/24.
//  Copyright © 2024 SmartSense. All rights reserved.
//

import SwiftUI

enum BeatSegmentOptions: String{
    case approved = "Approved"
    case requested = "Requested"
}
    

struct BeatListView: View {
    @SwiftUI.State private var currentSegment: BeatSegmentOptions = .approved
    var segmentOptions: [BeatSegmentOptions] = [.approved, .requested]

    var body: some View {
        VStack{
            Text("Beat List View")
            
            Picker("What is your favorite color?", selection: $currentSegment) {
                ForEach(segmentOptions, id: \.self) { selectedOption in
                    Text(selectedOption.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .onChange(of: currentSegment) { newValue in
                // action on change of segment
                print("hello \(newValue.rawValue)")
            }
        }
            .navigationTitle("Beat List")
            .toolbar {
                NavigationLink{
                    CreateBeatView(viewModel: CreateBeatView.ViewModel(beatName: ""))
                } label: {
                    Text("Create Beat")
                }
                
                NavigationLink{
                    CreateBeatView(viewModel: CreateBeatView.ViewModel(beatName: "Beat Name"))
                } label: {
                    Text("Edit Beat")
                }
            }
    }
}

#Preview {
    BeatListView()
}
