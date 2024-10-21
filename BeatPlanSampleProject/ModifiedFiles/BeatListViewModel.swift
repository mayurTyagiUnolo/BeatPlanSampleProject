//
//  BeatListViewModel.swift
//  BeatPlanSampleProject
//
//  Created by Mayur Tyagi on 18/10/24.
//
import SwiftUI

extension BeatListView{
    class ViewModel: ObservableObject{
        var beatCDHelperObj: BeatCDHelper
        @Published var beatList: [Beat]
        @Published var selectedSegmentIndex = 0
        @Published var searchedText = ""
        
        var filteredBeatList: [Beat]{
            if selectedSegmentIndex == 0{
                // filter for approved beats isDelete should be zero, and filter the beat name by searcherd Text.
                beatList.filter{ $0.mainOrStaged != selectedSegmentIndex && $0.isDeleted == 0 && filterForSearchedText(beat: $0) }
            }else{
                // filter for requested beats, remove the approved deleted beats and filter the beat name by searcherd Text.
                beatList.filter{ $0.mainOrStaged != selectedSegmentIndex && !($0.status == 2 && $0.isDeleted == 1) && filterForSearchedText(beat: $0) }
            }
        }
        
        init(beatCDHelperObj: BeatCDHelper) {
            self.beatCDHelperObj = beatCDHelperObj
            let beatList = beatCDHelperObj.fetchAllBeats()
            self.beatList = beatList
        }
        
        
        func filterForSearchedText(beat: Beat) -> Bool{
            let searchedText = self.searchedText.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
            let beatName = beat.beatName.lowercased()
            
            if searchedText.isEmpty{
                return true
            }
            return beatName.contains(searchedText)
        }
        
        
    }
}
