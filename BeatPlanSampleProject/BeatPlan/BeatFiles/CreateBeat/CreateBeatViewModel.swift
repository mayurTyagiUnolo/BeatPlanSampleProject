//
//  CreateBeatViewModel.swift
//  senseStaff
//
//  Created by Mayur on 02/10/24.
//  Copyright © 2024 SmartSense. All rights reserved.
//
import SwiftUI

extension CreateBeatView{
    class ViewModel: ObservableObject{
        var beatCDHelperObj: BeatCDHelper
        @Published var beat: Beat
        
        var clientVisits: [Visit] = []
        var locationVisits: [Visit] = []
        
        
        @Published var showDeleteConfirmation: Bool = false
        @Published var visitToDelete: Visit?
        
        init(beat: Beat? = nil, beatCDHelperObj: BeatCDHelper){
            self.beatCDHelperObj = beatCDHelperObj
            // Assign new Beat obj in case of fresh beat creation.
            self.beat = beat ?? Beat(beatID: UUID().uuidString,
                                     beatName: "",
                                     status: Utils.beatApprovalRequired ? Beat.Status.pending.rawValue : Beat.Status.notRequired.rawValue,
                                     isDeleted: 0,
                                     mainOrStaged: Utils.beatApprovalRequired ? Beat.MainOrStaged.staged.rawValue : Beat.MainOrStaged.main.rawValue ,
                                     visitList: Utils.visit,
                                     createdTs: "SSDate.getStringCurrentTimeStampInMS()",
                                     lastModifiedTs: "SSDate.getStringCurrentTimeStampInMS()")
            
            // to store preselected clients and locations in the respective list.
            for visit in self.beat.visitList{
                if visit.visitType == Visit.VisitType.locaation.rawValue{
                    locationVisits.append(visit)
                }else{
                    clientVisits.append(visit)
                }
            }
        }
        
        // code for added visit from the selected clients from the
        func clientsAdded(selectedClients: [Client]){
            clientVisits.removeAll()
            
            for client in selectedClients{
                let visit = Visit(beatVisitID: UUID().uuidString,
                                  visitType: client.employeeID != -2 ? Visit.VisitType.client.rawValue : Visit.VisitType.site.rawValue,
                                  visitAddress: client.address ?? "",
                                  visitName: client.clientName ?? "",
                                  lat:  0,
                                  lon:0,
                                  radius: 200,
                                  clientID: client.clientID,
                                  startTime: nil,
                                  endTime: nil,
                                  taskType: nil,
                                  sequence: 1,
                                  isDeleted: Beat.IsDeleted.no.rawValue,
                                  mainOrStaged: Utils.beatApprovalRequired ? Beat.MainOrStaged.staged.rawValue : Beat.MainOrStaged.main.rawValue,
                                  createdTs: "SSDate.getStringCurrentTimeStampInMS()",
                                  lastModifiedTs: "SSDate.getStringCurrentTimeStampInMS()")
                
                clientVisits.append(visit)
            }
        }
        
        func locationAdded(selectedLocations: [Location]){
            locationVisits.removeAll()
            
            for location in selectedLocations{
                let visit = Visit(beatVisitID: UUID().uuidString,
                                  visitType: Visit.VisitType.locaation.rawValue,
                                  visitAddress: location.locationAddress,
                                  visitName: location.locationName,
                                  lat: location.lat,
                                  lon: location.lon,
                                  radius: location.radius,
                                  clientID: location.placeID,
                                  startTime: nil,
                                  endTime: nil,
                                  taskType: nil,
                                  sequence: 1,
                                  isDeleted: Beat.IsDeleted.no.rawValue,
                                  mainOrStaged: Utils.beatApprovalRequired ? Beat.MainOrStaged.staged.rawValue : Beat.MainOrStaged.main.rawValue,
                                  createdTs: "SSDate.getStringCurrentTimeStampInMS()",
                                  lastModifiedTs: "SSDate.getStringCurrentTimeStampInMS()")
                
                locationVisits.append(visit)
            }
        }
        
        func saveButtonTapped(){
            self.beat.visitList = clientVisits + locationVisits
            if !beat.visitList.isEmpty{
//                self.beatCDHelperObj.saveBeat(beat: beat)
            }
        }
        
        func saveBtnShouldBeDisabled() -> Bool{
            let beatName = beat.beatName.trimmingCharacters(in: .whitespacesAndNewlines)
            let visitList = beat.visitList
            return beatName.isEmpty || visitList.isEmpty
        }
        
        func deleteVisit(visit: Visit) {
            withAnimation {
                if let index = beat.visitList.firstIndex(where: { $0.beatVisitID == visit.beatVisitID }) {
                    beat.visitList.remove(at: index)
                }
            }
        }
        
    }
    
}
