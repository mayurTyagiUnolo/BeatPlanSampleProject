//
//  CreateBeatViewModel.swift
//  BeatPlanSampleProject
//
//  Created by Mayur on 02/10/24.
//
import SwiftUI

extension CreateBeatView{
    class ViewModel: ObservableObject{
        @Published var clientList = [Client]()
        
        init() {
            print("create beat View model init")
        }
        
        deinit{
            print("create beat View model deinit")
        }
        
        func addClients(_ clients: [Client]){
            print(clients.count)
            clientList = clients
        }
    }
}
