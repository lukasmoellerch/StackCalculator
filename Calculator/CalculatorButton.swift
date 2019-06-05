//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Lukas Möller on 05.06.19.
//  Copyright © 2019 Lukas Möller. All rights reserved.
//

import SwiftUI
enum CalculatorButtonType {
    case dark
    case light
    case colored
}
struct CalculatorButton : View {
    let content: String
    var type: CalculatorButtonType = .light
    var action: ()->() = {}
    @State var pressed: Bool = false
    var color: some View {
        if pressed {
            switch type {
            case .dark:
                return Color(white: 0.25)
            case .light:
                return Color(white: 0.35)
            case .colored:
                return Color(hue: 1.0, saturation: 1.0, brightness: 0.9, opacity: 0.8)
            }
        }else{
            switch type {
            case .dark:
                return Color(white: 0.2)
            case .light:
                return Color(white: 0.3)
            case .colored:
                return Color(hue: 1.0, saturation: 1.0, brightness: 0.9, opacity: 1.0)
            }
        }
    }
    var body: some View {
        ZStack {
            color
            Text(content).font(.system(size: 25.0, design: .rounded))
        }
            .border(Color(white: 0.2), width: 0.5)
            .tapAction {
                self.action()
            }
            .longPressAction(minimumDuration: 0.0, maximumDistance: 0.0, {}, pressing: { pressed in
                self.pressed = pressed
            })
    }
}

#if DEBUG
struct CalculatorButton_Previews : PreviewProvider {
    static var previews: some View {
        CalculatorButton(content: "42", action: {})
    }
}
#endif
