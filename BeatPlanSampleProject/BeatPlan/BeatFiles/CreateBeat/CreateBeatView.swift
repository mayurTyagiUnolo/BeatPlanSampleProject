//
//  CreateBeatView.swift
//  senseStaff
//
//  Created by Mayur  on 25/09/24.
//  Copyright © 2024 SmartSense. All rights reserved.
//

import SwiftUI

struct CreateBeatView: View {
    @StateObject private var viewModel: ViewModel
    @SwiftUI.State private var showPlusMenu: Bool = false
    
    init(viewModel: @autoclosure @escaping () -> ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel())
    }
    
    var body: some View {
        VStack(spacing: 0){
            TextField(text: $viewModel.beat.beatName, label: {
                Text("Enter beat name *")
            })
            .textFieldStyle(RoundedTextFieldStyle(text: viewModel.beat.beatName, showSearchIcon: false))
            .padding(.horizontal, 16)
            .padding(.bottom, 5)
            
            // List of the clients
            ZStack(alignment: .bottomTrailing){
                if !viewModel.beat.visitList.isEmpty{
                    List(viewModel.beat.visitList, id: \.beatVisitID){ visit in
                        VStack(alignment: .leading, spacing: 5){
                            HStack(){
                                Text(visit.visitName)
                                    .padding(.horizontal)
                                    .lineLimit(1)
                                    .mainTextFont()
                                
                                Spacer()
                                
                                Button{
                                    print("Hello")
                                    viewModel.showDeleteConfirmation = true
                                    viewModel.visitToDelete = visit
                                } label: {
                                    Image(systemName: "trash")
                                        .foregroundStyle(.red)
                                        .padding(.horizontal)
                                        .background(.green)
                                }
                                .background(.purple)
                                .buttonStyle(.plain)
                                
                            }
                            .padding(.vertical, 5)

                            HStack(){
                                Image("beatLocation")
                                    .padding(.trailing, 5)
                                    .padding(.leading)
                                    .font(.footnote)
                                
                                Text(visit.visitAddress)
                                    .font(.footnote)
                                
                            }
                            .padding(.bottom, 5)
                            
//                            HStack{
//                                Picker(selection: $viewModel.beat.visitList[viewModel.beat.visitList.firstIndex(where: { $0.beatVisitID == visit.beatVisitID })!].taskType) {
//                                    ForEach(Utils.getCustomTask(), id: \.self){ task in
//                                        Text(task)
//                                    }
//                                } label: {
//                                    Text("Select Task")
//                                        .font(.footnote)
//                                }
//                                .accentColor(.black)
//                                .pickerStyle(MenuPickerStyle())
//                                .padding(.horizontal)
//                                
//                            }
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background(.gray.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(SwiftUI.Color.gray.opacity(0.2), lineWidth: 1)
                            })
                            .padding(.horizontal)
                            .padding(.bottom, 5)
                            
                            HStack{
                                Label("start time", systemImage: "clock")
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .background(.gray.opacity(0.1))
                                    .foregroundStyle(.gray)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .overlay(content: {
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(SwiftUI.Color.gray.opacity(0.2), lineWidth: 1)
                                    })
                                
                                Label("End time", systemImage: "clock")
                                    .foregroundStyle(.gray)
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .background(.gray.opacity(0.1))
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .overlay(content: {
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(SwiftUI.Color.gray.opacity(0.2), lineWidth: 1)
                                    })
                                
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(SwiftUI.Color.gray.opacity(0.2), lineWidth: 1)
                        })
                        .listRowSeparator(.hidden)
                        .listRowBackground(SwiftUI.Color.clear)
//                        .onTapGesture(perform: {
//                            print("cell tapped")
//                        })
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
                
                // Floating Plus Button to navigate on add client and location Screen.
                Button{
                    withAnimation {
                        showPlusMenu.toggle()
                    }
                } label: {
                    Image(systemName: "plus")
                        .font(.title.weight(.semibold))
                        .padding()
                        .background(SwiftUI.Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                        .rotationEffect(.degrees(showPlusMenu ? 135 : 0)) // Animation for rotation
                }
                .padding(10)
                
                if showPlusMenu {
                    VStack(alignment: .trailing, spacing: 10) {
                        
                        NavigationLink{
//                            AddClientView(viewModel: AddClientView.ViewModel(clientService: ClientService.shared, preSelectedClients: [], clientsAdded: viewModel.clientsAdded ))
                            
                        } label: {
                            Text("Add Clients/Sites")
                                .font(.custom("poppins_bold", size: 15))
                                .foregroundColor(.black)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 8)
                                .background(.white)
                                .cornerRadius(20)
                        }
                        
                        NavigationLink{
//                            AddLocationView(viewModel: AddLocationView.ViewModel(locations: [], locationAdded: viewModel.locationAdded))
                        } label: {
                            Text("Add Location")
                                .font(.custom("poppins_bold", size: 15))
                                .foregroundColor(.black)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 8)
                                .background(.white)
                                .cornerRadius(20)
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 80)
                    .transition(.scale.combined(with: .opacity))
                }
            }
            
            BottomSaveButton(buttonTitle: "Save", completionHandler: viewModel.saveButtonTapped, shouldDisable: viewModel.saveBtnShouldBeDisabled())
        }
        .alert("Delete Confirmation", isPresented: $viewModel.showDeleteConfirmation, presenting: viewModel.visitToDelete) { item in
            Button("Delete", role: .destructive) {
                viewModel.deleteVisit(visit: item)
            }
            Button("Cancel", role: .cancel) { }
        } message: { item in
            Text("Are you sure you want to delete \(item.visitName)?")
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .background(SwiftUI.Color(uiColor: VIEW_BACKGROUND_COLOR))
        .navigationTitle("Create Beat")
//        .onAppear{ showPlusMenu = false }
        .toolbar {
            NavigationLink{
                // optimize beat code
            } label: {
                Text("optimize")
            }
            .disabled(true)
        }
        .onTapGesture{
            withAnimation{
                showPlusMenu = false
            }
        }
    }
    
}


#Preview {
    CreateBeatView(viewModel: CreateBeatView.ViewModel(beatCDHelperObj: BeatCDHelper.shared))
}
