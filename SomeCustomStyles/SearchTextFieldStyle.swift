//
//  SearchTextFieldStyle.swift
//  BherubabaSample
//
//  Created by Mayur Tyagi on 27/09/24.
//

import SwiftUI

struct SearchTextFieldStyle: TextFieldStyle {
    @Binding var text: String
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 40, style: .continuous)
                        .stroke(SwiftUI.Color.gray.opacity(0.1), lineWidth: 1)
                    if text.isEmpty{
                        HStack{
                            Spacer()
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
