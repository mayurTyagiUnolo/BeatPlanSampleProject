//
//  BottomSaveButton.swift
//  BeatPlanSampleProject
//
//  Created by Mayur Tyagi on 04/10/24.
//

import SwiftUI

struct BottomSaveButton: View {
    var buttonTitle: String
    var completionHandler: () -> Void
    var shouldDisable: Bool = false
    
    var body: some View {
        VStack{
            Button{
                completionHandler()
            } label: {
                Text(buttonTitle)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(shouldDisable ? .gray : .blue)
            }
            .disabled(shouldDisable)
            .background(shouldDisable ? .gray : .blue)
            .foregroundStyle(SwiftUI.Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }
        .padding()
        .background(.white)
        .compositingGroup()
        .shadow(color: SwiftUI.Color(.lightGray), radius: 3)
    }
}

struct SecondaryButton: View{
    var buttonTitle: String
    var image: String?
    
    var body: some View{
        HStack{
            Text(buttonTitle)
            
            if let image{
                Image(image)
            }
        }
        .fontWeight(.medium)
        .foregroundStyle(.blue)
        .padding(.horizontal, 12)
        .padding(.vertical, 5)
        .overlay(
            Capsule()
                .stroke(.blue, lineWidth: 1)
        )
    }
}


#Preview {
    SecondaryButton(buttonTitle: "Optimize")
}
