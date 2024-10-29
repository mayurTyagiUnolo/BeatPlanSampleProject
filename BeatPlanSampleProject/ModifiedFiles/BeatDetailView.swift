//
//  BeatDetailView.swift
//  BeatPlanSampleProject
//
//  Created by Mayur Tyagi on 27/10/24.
//

import SwiftUI

struct BeatDetailView: View {
    var beat: Beat
    
    var body: some View {
        VStack{
            List(beat.visitList, id: \.beatVisitID){ visit in
                VStack(alignment: .leading, spacing: 10){
                    HStack{
                        Text(visit.visitName)
                            .padding(.horizontal)
                            .lineLimit(1)
                            .mainTextFont()
                        
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity, minHeight: 25,maxHeight: .infinity)
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
                        HStack{
                            Image("beatLocation")
                            
                            Text(visit.visitAddress)
                                .font(.footnote)
                        }
                        .padding(.leading)
                        
                        HStack{
                            Image("taskIcon")
                            
                            Text(visit.taskType ?? "None")
                                .font(.footnote)
                        }
                        .padding(.leading)
                        
                        if let startTime = visit.startTime,!startTime.isEmpty , let endTime = visit.endTime, !endTime.isEmpty{
                            HStack{
                                Image("scheduleIcon")
                                
                                Text("\(startTime) to \(endTime)")
                                    .font(.footnote)
                            }
                            .padding(.leading)
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
        .navigationTitle(beat.beatName)
        .toolbar {
            NavigationLink{
//                Navigate to Edit Beat Screen
            } label: {
                Image("editBeatIcon")
            }
        }
        
    }
}

#Preview {
    BeatDetailView(beat: Utils.beat)
}
