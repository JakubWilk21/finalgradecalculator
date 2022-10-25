//
//  ContentView.swift
//  finalgradecalculator
//
//  Created by Jakub Wilk on 9/30/22.
//

import SwiftUI
 
struct ContentView: View {
    @State var currentGradeTextField = ""
    @State var finalWeightTextField = ""
    @State var desiredGrade = 0.0
    @State var requiredGrade = 0.0
    var body: some View {
        VStack{
        Text("Final Grade Calculator")
        Text("Result")
        TextField("Current Grade", text: $currentGradeTextField)
            .multilineTextAlignment(.center)
        TextField("Weight of Final", text: $finalWeightTextField)
            .multilineTextAlignment(.center)
        Picker("Desired Semester Grade", selection: $desiredGrade){
        Text("A").tag(90.0)
        Text("B").tag(80.0)
        Text("C").tag(70.0)
        Text("D").tag(60.0)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
            Text("Required Grade on Final: " + (String)(requiredGrade))
                .padding()
                .font(.title)
                .multilineTextAlignment(.center)
        }
        
        .onChange(of: desiredGrade, perform: { newValue in
                    calculateGrade()
        })
        .background (requiredGrade > 100 ? Color.red : Color.green)
        .background (requiredGrade > 100 ? Color.red : Color.green.opacity(requiredGrade > 0 ? 1.0 : 0.0))
    }
    func calculateGrade () {
        if let currentGrade = Double(currentGradeTextField) {
            if let finalWeight = Double(finalWeightTextField) {
                if finalWeight < 100 && finalWeight > 0 {
                    let finalPercentage = finalWeight / 100.0
                    requiredGrade = max(0.0, (desiredGrade - (currentGrade * (1.0 - finalPercentage))) / finalPercentage)
                }}}}
}
 
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
