//
//  CreateBeatViewModel.swift
//  BeatPlanSampleProject
//
//  Created by Mayur on 02/10/24.
//
import SwiftUI

extension CreateBeatView{
    class ViewModel: ObservableObject{
        @Published var beatName: String
        @Published var selectedClientList = ClientService.shared.fetchObjectsToEdit()
        @Published var selectedVisits = [Visit]()
        
        
        init(beatName: String) {
            self.beatName = beatName
            print("create beat View model init")
        }
        
        deinit{
            print("create beat View model deinit")
        }
        
        func addClients(_ selectedClients: [Client]){
            selectedClientList = selectedClients
        }
    }
}
