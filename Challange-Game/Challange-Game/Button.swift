//
//  Button.swift
//  Challenge game
//
//  Created by Mahmoud Fouad on 6/4/21.
//

import SwiftUI

struct Buttons: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 120, height: 60, alignment: .center)
            .padding(20)
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom))
            .foregroundColor(.white)
            .font(.title2)
    }
}
