//
//  SwiftUIView.swift
//  BeatPlanSampleProject
//
//  Created by Mayur Tyagi on 15/10/24.
//

import SwiftUI

struct PlusButton: View {
    @Binding var showPlusMenu: Bool
    @State private var showRequestLeaveSheet = false
    @State private var addTsheet = false
    
    var body: some View {
        ZStack {
            Button(action: {
                withAnimation {
                    showPlusMenu.toggle()
                }
            }) {
                Image(systemName: showPlusMenu ? "xmark" : "plus")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
            }
            .offset(y: -30)
            
            if showPlusMenu {
                VStack(spacing: 10) {
                    PlusMenuItem(title: "Add TimeSheet", color: .green) {
                        addTsheet.toggle()
                    }
                    .sheet(isPresented: $addTsheet) {
                        
                    }
                    
                    PlusMenuItem(title: "Request Leave", color: .orange) {
                        showRequestLeaveSheet.toggle()
                    }
                    .sheet(isPresented: $showRequestLeaveSheet) {
                        
                    }
                }
                .offset(y: -150)
                .transition(.scale.combined(with: .opacity))
            }
        }
        .frame(width: 200 , height: 40)
    }
}

struct PlusMenuItem: View {
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom("poppins_bold", size: 20))
                .foregroundColor(.white)
                .padding(.horizontal, 15)
                .padding(.vertical, 8)
                .background(color)
                .cornerRadius(20)
        }
    }
}

#Preview(body: {
    PlusButton(showPlusMenu: .constant(false))
})
