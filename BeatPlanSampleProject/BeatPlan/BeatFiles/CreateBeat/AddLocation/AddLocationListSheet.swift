//
//  AddLocationListSheet.swift
//  BeatPlanSampleProject
//
//  Created by Mayur Tyagi on 09/10/24.
//
import SwiftUI

struct AddLocationListSheet: View{
    var continueBtnHandler: () -> Void
    var body: some View{
        VStack(alignment: .leading, spacing: 0){
            Text("Locations")
                .font(.system(size: 20, weight: .semibold))
                .padding(20)
            
            List(1..<100){ location in
                HStack{
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "mappin.circle.fill")
                                .padding(.trailing, 5)
                            Text("Client Name")
                                .mainTextFont()
                        }
                        .padding(.vertical, 2)
                        
                        Text("Address")
                            .subTextFont()
                    }
                    
                    Spacer()
                    
                    Image(systemName: "trash")
                        .foregroundStyle(.red)
                }
            }
            
            
            BottomSaveButton(buttonTitle: "Continue", completionHandler: continueBtnHandler)
        }
    }
}

#Preview {
    AddLocationListSheet(continueBtnHandler: { })
}
