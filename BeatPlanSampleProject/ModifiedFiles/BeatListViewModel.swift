//
//  BeatListViewModel.swift
//  BeatPlanSampleProject
//
//  Created by Mayur Tyagi on 18/10/24.
//
import SwiftUI

extension BeatListView{
    class ViewModel: ObservableObject{
        @Published var beatList: [Beat]
        var beatCDHelperObj: BeatCDHelper
        
        init(beatCDHelperObj: BeatCDHelper) {
            self.beatCDHelperObj = beatCDHelperObj
            self.beatList = beatCDHelperObj.fetchAllBeats()
        }
    }
}
