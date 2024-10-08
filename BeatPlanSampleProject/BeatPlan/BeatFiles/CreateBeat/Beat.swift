//
//  Beat.swift
//  BeatPlanSampleProject
//
//  Created by Mayur Tyagi on 08/10/24.
//

class Beat{
    var beatID: String
    var beatName: String
    var status: String
    var visitList: [Visit]
    var createdTs: String
    var lastModifiedTs: String
    
    init(beatID: String, beatName: String, status: String, visitList: [Visit], createdTs: String, lastModifiedTs: String) {
        self.beatID = beatID
        self.beatName = beatName
        self.status = status
        self.visitList = visitList
        self.createdTs = createdTs
        self.lastModifiedTs = lastModifiedTs
    }
}

class Visit{
    var beatVisitID: String
    var visitType: String
    var lat: Double
    var lon: Double
    var radius: Double
    var clientID: String?
    var startTime: String?
    var endTime: String?
    var taskType: String?
    var sequence: Int
    var createdTs: String
    var lastModifiedTs: String
    
    init(beatVisitID: String, visitType: String, lat: Double, lon: Double, radius: Double, clientID: String? = nil, startTime: String? = nil, endTime: String? = nil, taskType: String? = nil, sequence: Int, createdTs: String, lastModifiedTs: String) {
        self.beatVisitID = beatVisitID
        self.visitType = visitType
        self.lat = lat
        self.lon = lon
        self.radius = radius
        self.clientID = clientID
        self.startTime = startTime
        self.endTime = endTime
        self.taskType = taskType
        self.sequence = sequence
        self.createdTs = createdTs
        self.lastModifiedTs = lastModifiedTs
    }
}
