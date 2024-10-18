//
//  SegmentCustomStyle.swift
//  BeatPlanSampleProject
//
//  Created by Mayur Tyagi on 18/10/24.
//
import SwiftUI

struct SegmentCustomStyle: View {
    @Binding var selection: Int
    let options: [String]
    
    var body: some View {
        HStack(spacing: 0){
            ForEach(options.indices, id: \.self) { index in
                VStack{
                    Text(options[index])
                        .foregroundColor(selection == index ? Color.blue : Color.gray)
                        .onTapGesture {
                            withAnimation {
                                selection = index
                            }
                        }
                    
                    if selection == index {
                        Rectangle()
                            .fill(.blue)
                            .frame(height: 1)
                            
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}
