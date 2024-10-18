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
            let beat = Beat(beatID: UUID().uuidString, beatName: "Beat \(i)", status: "pending", visitList: [], createdTs: "", lastModifiedTs: "")
            beatList.append(beat)
        }
        return beatList
    }
}
