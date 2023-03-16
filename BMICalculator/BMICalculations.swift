//
//  BMICalculations.swift
//  BMICalculator
//
//  Created by Cormell, David - DPC on 24/02/2022.
//

import Foundation


class BMICalculations {
    func calculateBmi(weight: Double, height: Double, inputIsImperial: Bool = false) -> Double {
        let heightMultipler, weightMultipler: Double
        if (inputIsImperial) {
            heightMultiplier = 2.54
            weightMultipler = 0.453592
        } else {
            heightMultiplier = 1
            weightMultiplier = 1
        }
        return ((weight * weightMultiplier) / pow((height * heightMultiplier), 2) * 10000).rounded(toPlaces: 1)
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
        return "Your BMI is: \(bmi)\nYou are classified as \(classification)"
    }
}
