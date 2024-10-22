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
    
struct BeatListView: View{
    var body: some View{
        Text("View Beat")
            .fontWeight(.medium)
            .foregroundStyle(.blue)
            .padding(12)
            .overlay(
                Capsule()
//                RoundedRectangle(cornerRadius: 16)
                    .stroke(.blue, lineWidth: 1)
            )
    }
}


#Preview {
    BeatListView()
}
