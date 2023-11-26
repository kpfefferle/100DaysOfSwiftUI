//
//  ContentView.swift
//  TempConvert
//
//  Created by Kevin Pfefferle on 11/25/23.
//

import SwiftUI

struct ContentView: View {
    @State private var unitInput = "Celsius"
    @State private var unitOutput = "Farenheit"
    @State private var valueInput = 0.0

    @FocusState private var inputIsFocused: Bool

    let convertOptions = ["Celsius", "Farenheit", "Kelvin"]
    
    var inputInCelsius: Double {
        switch unitInput {
        case "Farenheit":
            return (valueInput - 32.0) / 9.0 * 5.0
        case "Kelvin":
            return valueInput - 273.15
        default:
            return valueInput
        }
    }
    
    var outputValue: Double {
        switch unitOutput {
        case "Farenheit":
            return (inputInCelsius * 9.0 / 5.0) + 32.0
        case "Kelvin":
            return inputInCelsius + 273.15
        default:
            return inputInCelsius
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Conversion units") {
                    Picker("Input unit", selection: $unitInput) {
                        ForEach(convertOptions, id: \.self) {
                            Text($0)
                        }
                    }

                    Picker("Output unit", selection: $unitOutput) {
                        ForEach(convertOptions, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Input temperature (\(unitInput))") {
                    TextField("Temperature", value: $valueInput, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                }
                
                Section("Output temperature (\(unitOutput))") {
                    Text(outputValue, format: .number)
                }
            }
            .navigationTitle("TempConvert")
            .toolbar {
                if inputIsFocused {
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
