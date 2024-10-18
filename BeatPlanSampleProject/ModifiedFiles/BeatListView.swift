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
    

struct BeatListView: View {
    var segmentOptions: [BeatSegmentOptions] = [.approved, .requested]
    @SwiftUI.State private var currentSegment: BeatSegmentOptions = .approved
    @SwiftUI.State private var searchedText = ""
    @SwiftUI.State var visitlist = [Visit]()
    @SwiftUI.State var beat: Beat?
    
    
    
    
    var body: some View {
        VStack{
            Picker("What is your favorite color?", selection: $currentSegment) {
                ForEach(segmentOptions, id: \.self) { selectedOption in
                    Text(selectedOption.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 16)
            .onChange(of: currentSegment) { newValue in
                // action on change of segment
                print("hello \(newValue.rawValue)")
            }
            
            TextField(text: $searchedText, label: {
                Text("Search here")
            })
            .padding(.horizontal, 16)
            .textFieldStyle(RoundedTextFieldStyle(text: searchedText))
            .onChange(of: searchedText) { newValue in
                // search logic in view model
            }
            
            List(1..<10){ client in
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                        Text("Beat Name")
                            .padding(.horizontal)
                            .lineLimit(1)
                            .mainTextFont()
                        Spacer()
                        Text("approved")
                            .padding(.vertical, 2)
                            .padding(.horizontal, 10)
                            .background(.green)
                            .clipShape(.capsule)
                            .subTextFont()
                        Menu {
                            Button("Edit", action: {} )
                            Button("Delete", action: {} )
                        } label: {
                            Image("threeDot")
                                .padding(.trailing, 5)
                        }
                        
                    }
                    .frame(maxWidth: .infinity, minHeight: 25,maxHeight: .infinity)
                    .background(.gray.opacity(0.2))
                    .clipShape(
                        .rect(
                            topLeadingRadius: 10,
                            bottomLeadingRadius: 0,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 10
                        )
                    )
                    
                    Text("Total Visits: 10")
                        .padding(.leading)
                        .font(.footnote)
                    
                    Text("Created by: Admin")
                        .padding(.leading)
                        .padding(.bottom, 5)
                        .font(.footnote)
                    
                    
                    if false {
                        VStack(alignment: .leading, spacing: 0){
                            Divider()
                            
                            
                            Text("Remark: Every thing is fine")
                                .padding(.leading)
                                .padding([.vertical], 10)
                                .font(.footnote)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(SwiftUI.Color.gray, lineWidth: 1)
                })
                .listRowSeparator(.hidden)
                .listRowBackground(SwiftUI.Color.clear)
            }
            .listStyle(.plain)
            .listRowSpacing(10)
            
            
        }
        .navigationTitle("Beat List")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            NavigationLink{
                CreateBeatView(viewModel: CreateBeatView.ViewModel(beatCDHelperObj: BeatCDHelper.shared))
                
            } label: {
                Text("Create Beat")
                
            }
            
            NavigationLink{
                CreateBeatView(viewModel: CreateBeatView.ViewModel(beat: beat, beatCDHelperObj: BeatCDHelper.shared))
                
            } label: {
                Text("Edit Beat")
                
            }
        }
    }
}


