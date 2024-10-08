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
                        VStack(alignment: .leading, spacing: 5){
                            HStack{
                                Text("Beat Name")
                                    .padding(.horizontal)
                                    .lineLimit(1)
                                    .mainTextFont()
                                Spacer()
                                Text("approved")
                                    .padding(.vertical, 2)
                                    .padding(.horizontal, 10)
                                    .background(.green)
                                    .clipShape(.capsule)
                                    .subTextFont()
                                Menu {
                                    Button("Edit", action: {} )
                                    Button("Delete", action: {} )
                                } label: {
                                    Image("threeDot")
                                        .padding(.trailing, 5)
                                }

                            }
                            .frame(maxWidth: .infinity, minHeight: 25,maxHeight: .infinity)
                            .background(.gray.opacity(0.2))
                            .clipShape(
                                .rect(
                                    topLeadingRadius: 10,
                                    bottomLeadingRadius: 0,
                                    bottomTrailingRadius: 0,
                                    topTrailingRadius: 10
                                )
                            )
                            
                            Text("Total Visits: 10")
                                .padding(.leading)
                                .font(.footnote)
                            
                            Text("Created by: Admin")
                                .padding(.leading)
                                .padding(.bottom, 5)
                                .font(.footnote)
                            
                            
                            if false {
                                VStack(alignment: .leading, spacing: 0){
                                    Divider()
                                    
                                    
                                    Text("Remark: Every thing is fine")
                                        .padding(.leading)
                                        .padding([.vertical], 10)
                                        .font(.footnote)
                                }
                            }
                            
                        }
                        
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(SwiftUI.Color.gray, lineWidth: 1)
                        })
                        .listRowSeparator(.hidden)
                        .listRowBackground(SwiftUI.Color.clear)
                    }
                    .listStyle(.plain)
                        
                    }else{
                        VStack{
                            Spacer()
                            
                            NavigationLink("Add Clients/Sites", destination: AddClientView(viewModel: AddClientView.ViewModel(clientService: ClientService.shared, preSelectedClients: viewModel.selectedClientList, clientsAdded: viewModel.addClients)))

                            
                            
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
                        .background(SwiftUI.Color.blue)
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


