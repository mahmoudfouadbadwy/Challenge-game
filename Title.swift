//
//  Title.swift
//  Challenge game
//
//  Created by Mahmoud Fouad on 6/4/21.
//

import SwiftUI

struct Title: ViewModifier {
    var font: Font = Font.title
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(font)
            .padding(.bottom, 20)
    }
}
