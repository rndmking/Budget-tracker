//
//  VisualBlurEffect.swift
//  Budget Tracker
//
//  Created by Роберт Гадеев on 08.01.2023.
//

import SwiftUI

struct VisualBlurEffect: UIViewRepresentable {
    var uiVisualEffect: UIVisualEffect?

    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        UIVisualEffectView()
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        uiView.effect = uiVisualEffect
    }
}
