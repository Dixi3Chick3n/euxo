//
//  Sequence.swift
//  Euxo
//
//  Created by Adam Laybourn on 20/11/2022.
//

import Foundation

struct Sequence {
    var numberOfSteps: Int
    var numberOfNotes: Int
    var numberOfStart: Int
    
    func calculate(steps: Int, notes: Int, start: Int) -> String {
        
        // Position: build an array of individual steps, from -1 to n-1
        var position: [Int] = []
        var step = -1
        while step < steps {
            position.append(step)
            step += 1
        }
        
        // Multiplied: build an array of steps multiplied by notes
        var multiplied: [Int] = []
        step = 0
        while step < position.count {
            multiplied.append(position[step] * notes)
            step += 1
        }
        
        // Remainder: build an array of remainders from steps
        var remainder: [Int] = []
        step = 0
        while step < position.count {
            remainder.append(multiplied[step] % steps)
            step += 1
        }
        
        // Notes & Rests: build an array to denote whether or not the spaces between the steps are notes or rests
        var notesOrRests: [String] = []
        step = 0
        var negativeRemainder: Int
        negativeRemainder = remainder[step] * remainder[step]
        remainder[step] = negativeRemainder
        while step < (position.count - 1) {
            if remainder[step] > remainder[step + 1] {
                notesOrRests.append("X")
            } else {
                notesOrRests.append("O")
            }
            step += 1
        }
        
        // Offset: fold the notesOrRests Array
        var offsetSequence: [String] = notesOrRests
        step = 0
        while step < start {
            offsetSequence.insert(notesOrRests[notesOrRests.count - (start - step)], at: step)
            step += 1
        }
        
        // Sequence: write out the sequence
        var sequence = ""
        step = 0
        while step < (remainder.count - 1) {
            sequence.append(offsetSequence[step] + " ")
            step += 1
        }
        
        return sequence
    }
}
