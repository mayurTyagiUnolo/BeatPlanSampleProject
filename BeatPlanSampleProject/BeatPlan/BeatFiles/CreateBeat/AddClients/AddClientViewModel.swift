//
//  AddClientViewModel.swift
//  senseStaff
//
//  Created by Mayur  on 26/09/24.
//  Copyright © 2024 SmartSense. All rights reserved.
//

import SwiftUI

extension AddClientView{
    class ViewModel: ObservableObject{
        @Published private(set) var clientList = [Client]()
        @Published private(set) var filteredClientList = [Client]()
        var clientsAdded: (([Client]) -> Void) // closure to return clients to the CreateBeatView
        
        var selectedClients: [Client]{
            clientList.filter { client in
                client.isSelected
            }
        }
        
        init(preSelectedClients: [Client] = [], clientsAdded: @escaping (([Client]) -> Void) ) {
            print("init started")
            self.clientsAdded = clientsAdded
            
            DispatchQueue.global().async {
                if (Utils.authorisation.clients == 1){
                    let clientList =  ClientCDHelper.shared.fetchAllObjsInBackground()
                    //switch to main thread due to main thread checker crash when initialize @published property on background thread
                    DispatchQueue.main.async{
                        self.clientList = clientList
                        self.filteredClientList = clientList
                        
                        // Edit Beat case - to select the client when ViewModel initialize
                        for selectedClient in preSelectedClients {
                            self.toggleSelection(for: selectedClient)
                        }
                        print("init finally finished")
                    }
                }
            }
            print("init finished")
        }
        
        deinit {
            print("Deinitializing AddClientViewModel")
        }
        
        // filter clients based on search
        func filterClients(for searchedText: String){
            let trimmedText = searchedText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
            if !trimmedText.isEmpty{
                filteredClientList = clientList.filter{ client in
                    let clientName = client.clientName?.lowercased() ?? ""
                    let address = client.address?.lowercased() ?? ""
                    
                    return clientName.contains(trimmedText) || address.contains(trimmedText)
                }
            }else{
                filteredClientList = clientList
            }
        }
        
        // select and deselect client from the filtered client list
        func toggleSelection(for client: Client) {
            if let index = filteredClientList.firstIndex(where: { $0.clientID == client.clientID }) {
                let toggledClient = filteredClientList[index]
                toggledClient.isSelected.toggle()
                filteredClientList[index] = toggledClient
            }
        }
        
    }
}
