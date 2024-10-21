//
//  AddClientView.swift
//  senseStaff
//
//  Created by Mayur  on 25/09/24.
//  Copyright © 2024 SmartSense. All rights reserved.
//
import SwiftUI

struct AddClientView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Text("Hello")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.red)

            VStack(alignment: .leading) {
                Spacer()
                HStack{
                    Text("Hello")
                        .background(Color.yellow) // Aligned to leading since VStack has align
                        .padding()
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the ZStack space
        }
    }
}


#Preview {
    AddClientView()
}
