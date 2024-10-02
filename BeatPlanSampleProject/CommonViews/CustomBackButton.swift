//
//  CustomBackButton.swift
//  senseStaff
//
//  Created by Mayur  on 25/09/24.
//  Copyright © 2024 SmartSense. All rights reserved.
//

import SwiftUI

struct CustomBackButton: View {
    @Environment(\.dismiss) var dismiss: DismissAction

    var body: some View {
        Button{
            dismiss()
        } label: {
            Image("new_back_icon")
        }
    }
}

//#Preview {
//    CustomBackButton(dismiss: <#Binding<DismissAction>#>)
//}
