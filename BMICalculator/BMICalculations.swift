//
//  BMICalculations.swift
//  BMICalculator
//
//  Created by Cormell, David - DPC on 24/02/2022.
//

import Foundation


class BMICalculations {
    func calculateBmi(weight: Double, height: Double, inputIsImperial: Bool = false) -> Double {
        let heightMul, weightMul: Double
        if (inputIsImperial) {
            heightMul = 2.54
            weightMul = 0.453592
        } else {
            heightMul = 1
            weightMul = 1
        }
        return ((weight * weightMul) / pow((height * heightMul), 2) * 10000).rounded(toPlaces: 1)
    }
    
    func lookUpBmiClassification(bmi: Double) -> String {
        if bmi < 18.5 { return "Underweight" }
        else if bmi < 25 { return "Healthy" }
        else if bmi < 30 { return "Overweight" }
        else { return "Obese" }
    }
    
    func getUserFacingBmiString(weight: Double, height: Double, inputIsImperial: Bool) -> String {
        let bmi = calculateBmi(weight: weight, height: height, inputIsImperial: inputIsImperial)
        let classification = lookUpBmiClassification(bmi: bmi)
        return "Your BMI is: \(bmi)\nYou are \(classification)"
    }
}
