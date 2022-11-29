//
//  ContentView.swift
//  Euxo
//
//  Created by Adam Laybourn on 28/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var sequence = Sequence(numberOfSteps: 16, numberOfNotes: 4, numberOfStart: 0)
    
    var body: some View {
        NavigationStack {
            Spacer()
            
            Form {
                // Steps
                Section {
                    Stepper("Steps: \(sequence.numberOfSteps)", value: $sequence.numberOfSteps, in: 1...16, step: 1)
                    
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(6)
                
                // Notes
                Section {
                    Stepper("Notes: \(sequence.numberOfNotes)", value: $sequence.numberOfNotes, in: 1...16, step: 1)
                    
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(6)
                
                // Offset
                Section {
                    Stepper("Offset: \(sequence.numberOfStart)", value: $sequence.numberOfStart, in: 0...sequence.numberOfSteps, step: 1)
                    
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(6)
            }
                        
            // Sequence
            Section {
                Text("Euclidean Sequence")
                    .padding(6)
                Text(sequence.calculate(steps: sequence.numberOfSteps, notes: sequence.numberOfNotes, start: sequence.numberOfStart))
                    .padding(6)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .font(.headline)
            .font(.subheadline)
            .navigationTitle("euxo")
            
            Spacer()
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
