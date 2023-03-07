//
//  ContentView.swift
//  BMICalculator
//
//  Created by David Cormell on 23/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var height = ""
    @State private var weight = ""
    @State private var useImperial = false
    @State private var bmiString = ""
    private let calc = BMICalculations()
    
    private var heightUnit: String {
        return useImperial ? "in" : "cm"
    }
    
    private var weightUnit: String {
        return useImperial ? "lb" : "kg"
    }
    
    var body: some View {
        VStack {
            Image("PublicHealth")
            Spacer()
            Toggle(isOn: $useImperial) {
                Text("Use Imperial Measurements")
            }
            TextField("Height (\(heightUnit))", text: $height)
                // On a mobile device, try our best to force the user to enter a valid number
                .keyboardType(.decimalPad)
            TextField("Weight (\(weightUnit))", text: $weight)
                .keyboardType(.decimalPad)
            Spacer()
            Text(bmiString)
                .multilineTextAlignment(.center)
            Spacer()
            Button("Calculate BMI!", action: {
                if let dWeight = Double(weight), let dHeight = Double(height) {
                    bmiString = calc.getUserFacingBmiString(weight: dWeight, height: dHeight, inputIsImperial: useImperial)
                } else {
                    bmiString = "Error calculating BMI - did you enter a number?"
                }
            })
        }
        .padding(15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
