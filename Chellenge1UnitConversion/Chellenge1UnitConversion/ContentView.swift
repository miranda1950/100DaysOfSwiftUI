//
//  ContentView.swift
//  Chellenge1UnitConversion
//
//  Created by COBE on 07.09.2022..
//

import SwiftUI

struct ContentView: View {
    
    @State private var temperature  = 0.0
    @State private var inputUnit = "Ce"
    @State private var convertedTempUnit = "Fa"
    
    let inputUnits = ["Ce", "Fa", "K"]
    
    var convertedTemp: Double {
        var temp = 0.0
        switch inputUnit {
        case "Ce":
            if convertedTempUnit == "Fe" {
                temp = temperature * 33.8
            }
            if convertedTempUnit == "K" {
                temp = temperature * 274.15
            }
        case "Fa":
            if convertedTempUnit == "Ce" {
                temp = temperature * (-17.22)
            }
            if convertedTempUnit == "K" {
                temp = temperature * 255.92
            }
        case "K":
            if convertedTempUnit == "Ce" {
                temp = temperature * (-272.15)
            }
            if convertedTempUnit == "Fa" {
                temp = temperature * (-457.87)
            }
        default:
            break
        
        }
        
        return temp
        
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    Picker("Choose value", selection: $inputUnit) {
                        ForEach(inputUnits, id: \.self) {
                            Text($0)
                        }
                    } .pickerStyle(.segmented)
                    TextField("Enter the temp", value: $temperature, format: .number) .keyboardType(.decimalPad)
                    
                } header: {
                    Text("Please select the value and enter thhe  temp")
                }
                Section {
                    Picker("Choose output value",
                           selection: $convertedTempUnit ) {
                        ForEach(inputUnits, id: \.self) {
                            Text($0)
                        }
                    } .pickerStyle(.segmented)
                    
                    Text(convertedTemp, format: .number)
                }
            } .navigationTitle("Temp Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
