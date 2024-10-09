//
//  RoundedTextFieldStyle.swift
//  BherubabaSample
//
//  Created by Mayur Tyagi on 27/09/24.
//

import SwiftUI

struct RoundedTextFieldStyle: TextFieldStyle {
    @Binding var text: String
    var showSearchIcon = true
    var innerBackgroundColor: Color = .clear
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(
                ZStack(alignment: .trailing){
                    RoundedRectangle(cornerRadius: 40, style: .continuous)
                        .stroke(SwiftUI.Color.gray, lineWidth: 1)
                    if showSearchIcon && text.isEmpty{
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                            .padding(10)
                    }
                    
                }
            )
            .background(
                RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .fill(innerBackgroundColor) // Inner background color
            )
            .padding(.vertical, 5)
    }
}

#Preview {
    TextField("Search", text: .constant(""))
        .textFieldStyle(RoundedTextFieldStyle(text: .constant("")))
}
