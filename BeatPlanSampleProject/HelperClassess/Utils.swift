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
    
    static let visit = Visit(beatVisitID: UUID().uuidString, visitType: 1, visitAddress: "addess", visitName: "visit name", lat: 1, lon: 1, radius: 11, clientID: UUID().uuidString, startTime: "", endTime: "", taskType: "", sequence: 1, isDeleted: 0, mainOrStaged: 1, createdTs: "", lastModifiedTs: "")
    
    static var beatApprovalRequired: Bool = true
}
