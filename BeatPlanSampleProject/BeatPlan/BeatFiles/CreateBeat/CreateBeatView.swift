//
//  ContentView.swift
//  BeatPlanSampleProject
//
//  Created by Mayur on 01/10/24.
//

import SwiftUI

struct CreateBeatView: View {
    @StateObject private var viewModel: ViewModel
    @SwiftUI.State private var beatName: String = ""
    
    init(viewModel: @autoclosure @escaping () -> ViewModel) {
        print("create beat view init")
        self._viewModel = StateObject(wrappedValue: viewModel())
    }
    
    var body: some View {
        VStack(spacing: 0){
            TextField(text: $viewModel.beatName, label: {
                Text("Enter beat name")
            })
            .textFieldStyle(RoundedTextFieldStyle(text: $viewModel.beatName, showSearchIcon: false))
            .padding(.horizontal, 16)
            .padding(.bottom, 5)
            
            // List of the clients
            ZStack(alignment: .bottomTrailing){
                if !viewModel.selectedClientList.isEmpty{
                    List(viewModel.selectedClientList, id: \.clientID){ client in
                        VStack(alignment: .leading, spacing: 5){
                            HStack(){
                                Text("Beat Name")
                                    .padding(.horizontal)
                                    .lineLimit(1)
                                    .mainTextFont()
                                Spacer()
                                Button{
                                    
                                } label: {
                                    Image(systemName: "trash")
                                        .foregroundStyle(.red)
                                        .padding(.horizontal)
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
                            
                            
                            HStack{
                                Image(systemName: "pencil")
                                    .padding(.trailing, 5)
                                    .font(.footnote)
                                
                                Text("Addesss")
                                    .font(.footnote)
                                    
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            
                            HStack{
                                Picker(selection: $beatName) {
                                    ForEach(1..<10){_ in 
                                        Text("beatName")
                                    }
                                } label: {
                                    Text("beatName")
                                        .font(.footnote)
                                }
                                .pickerStyle(MenuPickerStyle())
                                .padding(.horizontal)
                                
                            }
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background(.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(SwiftUI.Color.gray, lineWidth: 1)
                            })
                            .padding(.horizontal)
                            .padding(.bottom, 5)

                            
                            HStack{
                                Label("start time", systemImage: "clock")
                                    .foregroundStyle(.gray)
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(content: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(SwiftUI.Color.gray, lineWidth: 1)
                                    })
                                
                                Label("End time", systemImage: "clock")
                                    .foregroundStyle(.gray)
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(content: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(SwiftUI.Color.gray, lineWidth: 1)
                                    })
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 10)

                            
                            
                            
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(SwiftUI.Color.gray, lineWidth: 1)
                        })
                        .listRowSeparator(.hidden)
                        .listRowBackground(SwiftUI.Color.clear)
                        .onTapGesture(perform: {
                            print("cell tapped")
                        })
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
