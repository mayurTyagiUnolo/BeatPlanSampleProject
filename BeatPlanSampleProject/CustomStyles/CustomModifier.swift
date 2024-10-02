//
//  CustomModifier.swift
//  BeatPlanSampleProject
//
//  Created by Mayur on 02/10/24.
//

import SwiftUI

struct MainTextFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundStyle(.black.opacity(0.9))
            .fontWeight(.medium)
    }
}

struct SubTextFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundStyle(.secondary)
            .fontWeight(.regular)
    }
}
