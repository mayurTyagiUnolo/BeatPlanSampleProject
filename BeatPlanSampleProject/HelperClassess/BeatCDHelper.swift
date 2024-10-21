//
//  BeatCDHelper.swift
//  BeatPlanSampleProject
//
//  Created by Mayur Tyagi on 18/10/24.
//
import Foundation

class BeatCDHelper{
    private init(){}
    static let shared = BeatCDHelper()
    
    func fetchAllBeats() -> [Beat] {
        var beatList: [Beat] = []
        for i in 1...10{
            let beat = Beat(beatID: UUID().uuidString, beatName: "MG Road", status: 1, isDeleted: 0, mainOrStaged: 1, visitList: [], createdTs: "", lastModifiedTs: "")
            
            let beat2 = Beat(beatID: UUID().uuidString, beatName: "MG Road", status: 1, isDeleted: 0, mainOrStaged: 0, visitList: [], createdTs: "", lastModifiedTs: "")
            
            
            beatList.append(beat)
            beatList.append(beat2)
            
        }
        return beatList
    }
}
