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
    
    var body: some View {
        VStack{
            Button{
                completionHandler()
            } label: {
                Text(buttonTitle)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .background(SwiftUI.Color.blue)
            .foregroundStyle(SwiftUI.Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }
        .padding()
        .background(.white)
        .compositingGroup()
        .shadow(color: SwiftUI.Color(.lightGray), radius: 3)
    }
}

#Preview {
    BottomSaveButton(buttonTitle: "Save", completionHandler: {})
}