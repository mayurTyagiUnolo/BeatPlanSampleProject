//
//  RoundedTextFieldStyle.swift
//  BherubabaSample
//
//  Created by Mayur Tyagi on 27/09/24.
//

import SwiftUI

struct RoundedTextFieldStyle: TextFieldStyle {
    @Binding var text: String
    var showSearch = true
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(
                ZStack(alignment: .trailing){
                    RoundedRectangle(cornerRadius: 40, style: .continuous)
                        .stroke(SwiftUI.Color.gray.opacity(0.1), lineWidth: 1)
                    if showSearch{
                        if text.isEmpty{
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.gray)
                                .padding(10)
                        }
                    }
                    
                }
            )
            .padding(.vertical, 5)
    }
}
