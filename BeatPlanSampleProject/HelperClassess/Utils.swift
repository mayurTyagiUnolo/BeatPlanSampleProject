//
//  Utils.swift
//  BeatPlanSampleProject
//
//  Created by Mayur Tyagi on 01/10/24.
//
import Foundation

class Utils {
    static let authorisation = Authorization()
    
    
    struct Authorization {
        let clients = 1
    }
    
    static let visit = Visit(beatVisitID: UUID().uuidString, visitType: "client", lat: 0, lon: 0, radius: 0, sequence: 1, createdTs: "0", lastModifiedTs: "0")
}
