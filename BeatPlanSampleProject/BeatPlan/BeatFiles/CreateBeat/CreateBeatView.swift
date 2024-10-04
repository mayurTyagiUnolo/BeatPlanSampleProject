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
        VStack(spacing: 0){
            TextField(text: $viewModel.beatName, label: {
                Text("Enter beat name")
            })
            .textFieldStyle(RoundedTextFieldStyle(text: $viewModel.beatName, showSearch: false))
            .padding(10)
            
            // List of the clients
            ZStack(alignment: .bottomTrailing){
                if !viewModel.selectedClientList.isEmpty{
                    List(viewModel.selectedClientList, id: \.clientID){ client in
                        VStack(spacing: 0){
                            HStack{
                                Text("Beat Name")
                                    .padding(.horizontal)
                                    .lineLimit(1)
                                Spacer()
                                Text("status")
                                Image("beatClient")
                                    .padding(.horizontal)
                            }
                            .frame(maxWidth: .infinity, minHeight: 35)
                            .background(.gray.opacity(0.2))
                            
                            Text(client.clientName ?? "client name is nil")
                                .background(.red)
                            Text(client.clientName ?? "client name is nil")
                            Text(client.clientName ?? "client name is nil")
                            Text(client.clientName ?? "client name is nil")
                            Text(client.clientName ?? "client name is nil")
                            Text(client.clientName ?? "client name is nil")
                            Text(client.clientName ?? "client name is nil")
                            Text(client.clientName ?? "client name is nil")
                        }
                        .background(.green)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(SwiftUI.Color.gray, lineWidth: 1)
                        })
                        .foregroundStyle(.red)
                        .listRowSeparator(.hidden)
                        .listRowBackground(SwiftUI.Color.clear)
                    }
                    .listStyle(.plain)
                        
                    }else{
                        VStack{
                            Spacer()
                            VStack(spacing: 10){
                                Text("List is empty")
                                    .font(.system(size: 20, weight: .bold))
                                Text("Press + button to add visits")
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                
                
                Menu {
                    NavigationLink("Add Clients/Sites", destination: AddClientView(viewModel: AddClientView.ViewModel(clientService: ClientService.shared, preSelectedClients: viewModel.selectedClientList, clientsAdded: viewModel.addClients)))
                    NavigationLink("Add Location", destination: AddLocationView() )
                } label: {
                    Image(systemName: "plus")
                        .font(.title.weight(.semibold))
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
                .padding()

            }
                
            
            BottomSaveButton(buttonTitle: "Save", completionHandler: saveButtonTapped)
                
            
            
            
        }
        
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .background(SwiftUI.Color(uiColor: VIEW_BACKGROUND_COLOR))
        .navigationTitle("Create Beat")
        .toolbar {
            NavigationLink{
                // optimize beat code
            } label: {
                Label("Optimize", image: "route")
            }
            .disabled(true)
        }
    }
    
    func saveButtonTapped(){
        print("save Button pressed")
    }
}

#Preview {
    CreateBeatView(viewModel: CreateBeatView.ViewModel(beatName: ""))
}


