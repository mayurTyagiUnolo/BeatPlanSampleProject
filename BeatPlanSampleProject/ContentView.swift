//
//  ContentView.swift
//  BeatPlanSampleProject
//
//  Created by Mayur Tyagi on 01/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showAddClient: Bool = false
    @State private var showEditBeatClient: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                
                Button("Add Beat"){
                    showAddClient = true
                }
                
                
                //                NavigationLink("Add clients in Beat"){
                //                    AddClientView(viewModel: AddClientView.ViewModel())
                //                }
                //
                Button("Edit Beat"){
                    showEditBeatClient = true
                }
                
                
                //                NavigationLink("Edit Beat"){
                //                    let client1 = Client(clientName: "mayur", age: 22, address: "unolo", clientID: "1")
                //                    let client3 = Client(clientName: "mayur", age: 22, address: "unolo", clientID: "3")
                //                    AddClientView(viewModel: AddClientView.ViewModel(selectedClientsToEdit: [client1, client3]))
                //                }
            }
            .navigationDestination(isPresented: $showAddClient, destination: {
                AddClientView(viewModel: AddClientView.ViewModel())
            })
            .navigationDestination(isPresented: $showEditBeatClient, destination: {
                let client1 = Client(clientName: "mayur", age: 22, address: "unolo", clientID: "1")
                let client3 = Client(clientName: "mayur", age: 22, address: "unolo", clientID: "3")
                AddClientView(viewModel: AddClientView.ViewModel(selectedClientsToEdit: [client1, client3]))
            })
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
