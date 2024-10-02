//
//  CustomToggle.swift
//  senseStaff
//
//  Created by Mayur  on 25/09/24.
//  Copyright © 2024 SmartSense. All rights reserved.
//

import SwiftUI

struct ListMapToggleStyle: ToggleStyle {
    var listSelectedImage: String = "listSelectedSwitch"
    var mapSelectedImage: String = "mapSelectedSwitch"
    
    func makeBody(configuration: Configuration) -> some View {
        Button {
                configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(configuration.isOn ? mapSelectedImage : listSelectedImage)
            }
        }
        .buttonStyle(.plain)
    }
}

