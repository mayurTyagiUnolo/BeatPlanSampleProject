//
//  AddClientView.swift
//  senseStaff
//
//  Created by Mayur  on 25/09/24.
//  Copyright © 2024 SmartSense. All rights reserved.
//
import SwiftUI

extension AddClientView{
    // Map View to add the clients from the map.
    struct MapView: View{
        @Environment(\.dismiss) var dismiss
        @EnvironmentObject var viewModel: AddClientView.ViewModel
        @Binding var searchedText: String
        @Binding var showFilterSheet: Bool
        
        var continueCompletionHandler: () -> Void
        
        var body: some View{
            VStack(spacing: 0){
                ZStack(alignment: .top){
                    
                    // Implementing Google Map by using UIViewRepresentable protocol because Google Map SDK's "GMSMapView" is a UIKit View. Here GoogleMapView() is a bridge between SwiftUI and UIKit.
                    GoogleMapView()
                    
                    // Hstack for the search and filter view
                    HStack(spacing: 5){
                        TextField(text: $searchedText, label: {
                            Text("Search here")
                        })
                        .textFieldStyle(RoundedTextFieldStyle(text: searchedText, innerBackgroundColor: .white))
                        .onChange(of: searchedText) { newValue in
                            viewModel.filterClients(for: newValue)
                        }
                        Button{
                            showFilterSheet = true
                        } label: {
                            Image("smartFilter")
                                .padding()
                                .background(.white)
                                .clipShape(.circle)
                        }
                    }
                    .padding(.vertical, 2)
                    .padding(.horizontal, 10)
                }
                
                BottomSaveButton(buttonTitle: "Continue", completionHandler: continueCompletionHandler)
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

extension AddClientView{
    // List View to add the clients from the list.
    struct ListView: View {
        @Environment(\.dismiss) var dismiss
        @EnvironmentObject var viewModel: AddClientView.ViewModel
        @Binding var searchedText: String
        @Binding var showFilterSheet: Bool
        
        var continueCompletionHandler: () -> Void
        
        var body: some View {
            VStack(spacing: 0){
                //Hstack for search and filter
                HStack(spacing: 5){
                    TextField(text: $searchedText, label: {
                        Text("Search here")
                    })
                    .textFieldStyle(RoundedTextFieldStyle(text: searchedText))
                    .onChange(of: searchedText) { newValue in
                        viewModel.filterClients(for: newValue)
                    }
                    Button{
                        showFilterSheet = true
                    } label: {
                        Image("smartFilter")
                            .padding()
                            .background(.gray.opacity(0.1))
                            .clipShape(.circle)
                    }
                }
                .padding(.vertical, 2)
                .padding(.horizontal, 10)
                
                // List of the clients
                if !viewModel.filteredClientList.isEmpty{
                    List(viewModel.filteredClientList, id: \.clientID){ client in
                        HStack{
                            VStack(alignment: .leading){
                                HStack{
                                    Image(client.employeeID != -2 ? "beatClient" : "beatSite")
                                    Text(client.clientName ?? "--")
                                        .mainTextFont()
                                }
                                Text(client.address ?? "No Address found")
                                    .subTextFont()
                            }
                            
                            Spacer()
                            
                            Button{
                                viewModel.toggleSelection(for: client)
                            } label: {
                                Image(client.isSelected ? "checkedBox" : "unCheckedBox")
                                    .foregroundStyle(client.isSelected ? .green : .gray)
                                    .font(.system(size: 20))
                            }
                        }
                        .listRowBackground(SwiftUI.Color.clear)
                    }
                    .listStyle(.plain)
                    
                }else{
                    Spacer()
                    VStack(spacing: 10){
                        Text("List is empty")
                            .font(.system(size: 20, weight: .bold))
                        Text("No clients found")
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                }
                
                // VStack for the continue button..
                BottomSaveButton(buttonTitle: "Continue", completionHandler: continueCompletionHandler)
                
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

struct AddClientView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: ViewModel
    @SwiftUI.State private var showMapView: Bool = false
    @SwiftUI.State private var searchedText: String = ""
    @SwiftUI.State private var showFilterSheet: Bool = false
   
    // following dependency injection principle..
    init(viewModel: @autoclosure @escaping () -> ViewModel) {
        print("Add client view init")
        self._viewModel = StateObject(wrappedValue: viewModel())
    }

    var body: some View {
        VStack{
            if showMapView{
                MapView(searchedText: $searchedText, showFilterSheet: $showFilterSheet, continueCompletionHandler: continueButtonTapped)
            }else{
                ListView(searchedText: $searchedText, showFilterSheet: $showFilterSheet, continueCompletionHandler: continueButtonTapped)
            }
        }
        .background(SwiftUI.Color(uiColor: VIEW_BACKGROUND_COLOR))
        .environmentObject(viewModel)
        .navigationTitle("Add Clients/Sites")
        .toolbar{
            Toggle("List/Map View", isOn: $showMapView)
                .toggleStyle(ListMapToggleStyle())
                .labelsHidden()
        }
        .sheet(isPresented: $showFilterSheet) {
            SmartFilterView()
        }
    }
    
    func continueButtonTapped(){
        viewModel.clientsAdded(viewModel.selectedClients)
        dismiss()
    }
}

#Preview {
    AddClientView(viewModel: AddClientView.ViewModel(clientService: ClientService.shared, preSelectedClients: [Client(clientName: "mayur", age: 22, address: "unolo", clientID: "1")], clientsAdded: {_ in }))
}
