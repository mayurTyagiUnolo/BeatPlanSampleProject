//
//  ContentView.swift
//  BeatPlanSampleProject
//
//  Created by Mayur on 01/10/24.
//

import SwiftUI

struct CreateBeatView: View {
    @StateObject private var viewModel: ViewModel
    
    init(viewModel: @autoclosure @escaping () -> ViewModel) {
        print("create beat view init")
        self._viewModel = StateObject(wrappedValue: viewModel())
    }
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 50){
                NavigationLink("Add Client"){
                    AddClientView(viewModel: AddClientView.ViewModel(clientsAdded: viewModel.addClients))
                }
                
                NavigationLink("Edit Client"){
                    let selectedClientList = ClientCDHelper.shared.fetchObjectsToEdit()
                    
                    AddClientView(viewModel: AddClientView.ViewModel(preSelectedClients: selectedClientList, clientsAdded: viewModel.addClients))
                }
                
                List(viewModel.clientList, id: \.clientID){ client in
                    HStack{
                        VStack(alignment: .leading){
                            HStack{
                                Image(client.employeeID != -2 ? "beatClient" : "beatSite")
                                Text(client.clientName ?? "--")
                                    .foregroundStyle(.black)
                            }
                            Text(client.address ?? "No Address found")
                                .foregroundStyle(.background)
                        }
                        
                        Spacer()
                        
                        Button{
//                            viewModel.toggleSelection(for: client)
                        } label: {
                            Image(client.isSelected ? "checkedBox" : "unCheckedBox")
                                .foregroundStyle(client.isSelected ? .green : .gray)
                                .font(.system(size: 20))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CreateBeatView(viewModel: CreateBeatView.ViewModel())
}
