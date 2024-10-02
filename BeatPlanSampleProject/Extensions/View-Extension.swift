//
//  View-Extension.swift
//  BeatPlanSampleProject
//
//  Created by Mayur on 02/10/24.
//

import SwiftUI

extension View {
    func mainTextFont() -> some View{
        modifier(MainTextFont())
    }
    
    func subTextFont() -> some View{
        modifier(SubTextFont())
    }
}
