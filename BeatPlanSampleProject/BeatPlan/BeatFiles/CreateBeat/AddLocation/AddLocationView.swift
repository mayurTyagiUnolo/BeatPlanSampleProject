//
//  AddLocationView.swift
//  senseStaff
//
//  Created by Mayur  on 25/09/24.
//  Copyright © 2024 SmartSense. All rights reserved.
//

import SwiftUI

struct AddLocationView: View {
    @Environment(\.dismiss) var dismiss
    @SwiftUI.State private var searchedText: String = ""
    @StateObject private var viewModel: ViewModel
    let sheetHeights = stride(from: 0.2, through: 1.0, by: 0.1).map { PresentationDetent.fraction($0) }
    
    // properties for lower versions
    var isiOSLowerVersion: Bool // lower version than 16.4 -> .presentationBackgroundInteraction(.enabled) does not work on sheet for lower versions.
    @State private var showMap = true
    
    // following dependency injection principle..
    init(viewModel: @autoclosure @escaping () -> ViewModel) {
        print("Add client view init")
        self._viewModel = StateObject(wrappedValue: viewModel())
        
        if #available(iOS 16.4, *) {
            self.isiOSLowerVersion = true
        }else{
            self.isiOSLowerVersion = false
        }
    }
    
    var body: some View {
        VStack(spacing: 0){
            ZStack(alignment: .top){
                
                MapView()
                TextField(text: $searchedText, label: {
                    Text("Search here")
                })
                .textFieldStyle(RoundedTextFieldStyle(text: searchedText, innerBackgroundColor: .white))
                .onChange(of: searchedText) { newValue in
                    //                viewModel.filterClients(for: newValue)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 2)
                
            }
            
            
            // always disable this button - sheet is not visible means no location visit selected.
            BottomSaveButton(buttonTitle: "Continue", completionHandler: {}, shouldDisable: true )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .navigationTitle("Add Locations")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: .constant(!viewModel.locations.isEmpty && !isiOSLowerVersion)) {
            if #available(iOS 16.4, *) {
//                AddLocationListSheet(continueBtnHandler: continueBtnTapped)
//                    .presentationDetents(Set(sheetHeights))
//                    .presentationDragIndicator(.visible)
//                    .interactiveDismissDisabled()
//                    .presentationBackgroundInteraction(.enabled)
            }else{
               
            }
        }
        .sheet(isPresented: .constant(isiOSLowerVersion && showMap), onDismiss: { showMap = false }) {
            AddLocationListSheet(continueBtnHandler: continueBtnTapped)
                .presentationDetents([.large, .medium])
                .presentationDragIndicator(.visible)
        }
        .toolbar {
            if #available(iOS 16.4, *) {
                Toggle("List/Map View", isOn: $showMap)
                    .toggleStyle(ListMapToggleStyle())
                    .labelsHidden()
            }else{
                
            }
        }
    }
    
    func continueBtnTapped(){
        print("sheet continue btn pressed")
        viewModel.locations.removeAll()
        dismiss()
    }
}


#Preview {
    
    AddLocationView(viewModel: AddLocationView.ViewModel(locations: [Utils.visit]))
}



struct MapView: View {
    var body: some View {
        VStack{
            Text("this is map view")
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
    }
}
