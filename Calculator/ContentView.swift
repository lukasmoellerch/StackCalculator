//
//  ContentView.swift
//  Calculator
//
//  Created by Lukas Möller on 05.06.19.
//  Copyright © 2019 Lukas Möller. All rights reserved.
//

import SwiftUI

enum CalulatorOperator {
    case divide
    case times
    case subtract
    case add
    
    case percent
}

struct ContentView : View {
    @State var display: String = "0"
    @State var stack: [Float] = []
    var displayString: String {
        get {
            if display == "" {
                return "0.0"
            }else{
                return display
            }
        }
    }
    func handleOperator(_ op: CalulatorOperator) {
        switch op {
        case .divide:
            guard let b = stack.popLast(),
                let a = stack.popLast() else {
                    return
            }
            stack.append(a / b)
        case .times:
            guard let b = stack.popLast(),
                let a = stack.popLast() else {
                    return
            }
            stack.append(a * b)
        case .subtract:
            guard let b = stack.popLast(),
                let a = stack.popLast() else {
                    return
            }
            stack.append(a - b)
        case .add:
            guard let b = stack.popLast(),
                let a = stack.popLast() else {
                    return
            }
            stack.append(a + b)
        case .percent:
            guard let a = stack.popLast() else {
                    return
            }
            stack.append(a / 100.0)
        }
    }
    func handleNumber(_ number: Int) {
        if display == "0" {
            display = number.description
            return
        }
        display = display + number.description
    }
    var body: some View {
        HStack(alignment: .bottom, spacing: 0.0) {
            List(0..<stack.count) { i in
                Text(self.stack[i].description)
            }
            VStack(alignment: .trailing, spacing: 0.0) {
                HStack {
                    Text(display)
                        .font(.system(size: 40.0, design: .rounded))
                        .multilineTextAlignment(.trailing)
                        .padding(.horizontal, 10.0)
                        .padding(.top, 20.0)
                        .padding(.bottom, 5.0)
                }
                HStack(spacing: 0.0) {
                    CalculatorButton(content: "AC", type: .dark, action: {self.display = "0"})
                    CalculatorButton(content: "±", type: .dark, action: {
                        if self.display.contains("-") {
                            self.display = self.display.replacingOccurrences(of: "-", with: "")
                        }else{
                            self.display = "-\(self.display)"
                        }
                    })
                    CalculatorButton(content: "%", type: .dark, action: {self.handleOperator(.percent)})
                    CalculatorButton(content: "÷", type: .colored, action: {self.handleOperator(.divide)})
                }
                HStack(spacing: 0.0) {
                    CalculatorButton(content: "7", action: {self.handleNumber(7)})
                    CalculatorButton(content: "8", action: {self.handleNumber(8)})
                    CalculatorButton(content: "9", action: {self.handleNumber(9)})
                    CalculatorButton(content: "⨉", type: .colored, action: {self.handleOperator(.times)})
                }
                HStack(spacing: 0.0) {
                    CalculatorButton(content: "4", action: {self.handleNumber(4)})
                    CalculatorButton(content: "5", action: {self.handleNumber(5)})
                    CalculatorButton(content: "6", action: {self.handleNumber(6)})
                    CalculatorButton(content: "-", type: .colored, action: {self.handleOperator(.subtract)})
                }
                HStack(spacing: 0.0) {
                    CalculatorButton(content: "1", action: {self.handleNumber(1)})
                    CalculatorButton(content: "2", action: {self.handleNumber(2)})
                    CalculatorButton(content: "3", action: {self.handleNumber(3)})
                    CalculatorButton(content: "+", type: .colored, action: {self.handleOperator(.add)})
                }
                HStack(spacing: 0.0) {
                    CalculatorButton(content: "0", action: {self.handleNumber(0)})
                        .relativeWidth(1.5)
                    CalculatorButton(content: ",", action: {self.display = self.display + "."})
                    CalculatorButton(content: "↑", type: .colored, action: {
                        guard let value = Float(self.display) else {
                            return
                        }
                        self.stack.append(value)
                        self.display = "0"
                    })
                }
            }
        }
            .frame(minWidth: 500.0, minHeight: 330)
    }
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
