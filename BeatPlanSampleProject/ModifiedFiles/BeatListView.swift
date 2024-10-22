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
    @StateObject private var viewModel: ViewModel
    
    var segmentOptions: [String] = [BeatSegmentOptions.approved.rawValue, BeatSegmentOptions.requested.rawValue]
    
    init(viewModel: @autoclosure @escaping () -> ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel())
    }
    
    var body: some View {
        VStack{
            SegmentCustomStyle(selection: $viewModel.selectedSegmentIndex, options: segmentOptions)
                .padding(.top, 10)
            
            TextField(text: $viewModel.searchedText, label: {
                Text("Search here")
            })
            .padding(.horizontal, 16)
            .textFieldStyle(RoundedTextFieldStyle(text: viewModel.searchedText, innerBackgroundColor: .gray.opacity(0.2), showBorder: false))
            
            List(viewModel.filteredBeatList, id: \.beatID){ beat in
                VStack(alignment: .leading, spacing: 10){
                    HStack{
                        Text(beat.beatName)
                            .padding(.horizontal)
                            .lineLimit(1)
                            .mainTextFont()
                        
                        Spacer()
                        
                        Text("status")
                            .padding(.vertical, 2)
                            .padding(.horizontal, 10)
                            .background(.green.opacity(0.2))
                            .foregroundStyle(.green)
                            .clipShape(.capsule)
                            .font(.footnote)
                        
                        Menu {
                            Button("Edit", action: {} )
                            Button("Delete", action: {} )
                        } label: {
                            Image("threeDot")
                                .padding(.trailing, 5)
                        }
                        
                    }
                    .frame(maxWidth: .infinity, minHeight: 25, maxHeight: .infinity)
                    .background(.gray.opacity(0.1))
                    .clipShape(
                        .rect(
                            topLeadingRadius: 10,
                            bottomLeadingRadius: 0,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 10
                        )
                    )
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("Total Visits: \(beat.visitList.count)")
                            .padding(.leading)
                            .font(.footnote)
                        
                        if true{
                            Text("Created by: Admin")
                                .padding(.leading)
                                .font(.footnote)
                        }
                        
                        
                        if true{
                            VStack(alignment: .leading, spacing: 0){
                                Divider()
                                
                                Text("Remark: Every thing is not fine.")
                                    .lineLimit(1)
                                    .padding(.leading)
                                    .padding(.top, 10)
                                    .font(.footnote)
                                    .frame(maxHeight: .infinity)
                            }
                        }
                    }
                    .padding(.bottom, 10)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(SwiftUI.Color.gray.opacity(0.3), lineWidth: 1)
                })
                .listRowSeparator(.hidden)
                .listRowBackground(SwiftUI.Color.clear)
            }
            .listStyle(.plain)
            .listRowSpacing(3)
            
        }
        .background(SwiftUI.Color(uiColor: VIEW_BACKGROUND_COLOR))
        .navigationTitle("Beats")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            NavigationLink("Create Beat"){
//                CreateBeatView(viewModel: CreateBeatView.ViewModel(beatCDHelperObj: BeatCDHelper.shared))
            }
        }
    }
}

#Preview {
    BeatListView(viewModel: BeatListView.ViewModel(beatCDHelperObj: BeatCDHelper.shared))
}
