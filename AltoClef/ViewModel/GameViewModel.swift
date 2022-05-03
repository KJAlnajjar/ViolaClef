//
//  GameViewModel.swift
//  AltoClef
//
//  Created by Khalil AlNajjar on 25/04/2022.
//

import Foundation
import UIKit

struct GameViewModel {
    
    init() {}
    
    func getLeftArmFinger(using noteName: Notes) -> [LeftArmFingers] {
        switch noteName {
        case .C3:
            return [.openString]
        case .D3, .A3, .E4, .B4:
            return [.firstFinger]
        case .E3, .B3, .F4, .C5:
            return [.secondFinger]
        case .F3, .C4, .G4, .D5:
            return [.thirdFinger]
        case .G3, .D4, .A4, .E5:
            return [.forthFinger, .openString]
        }
    }
    
    func getAllNotesInformation() -> [NotesInformation] {
        return NotesInformation.data
    }
    
    func getRandomNoteInformation() -> NotesInformation? {
        return NotesInformation.data.randomElement()
    }
    
    func getAllNotesWithoutDuplication() -> [String] {
        let notes = Notes.allCases.map({ String($0.rawValue.dropLast()) })
        return notes.uniqued()
    }
    
    func isTheNoteTheUserHasChosenCorrect(correctAnswer: NotesInformation, selectedChoice: NotesWithoutOctaves) -> Bool {
        let correctNote = correctAnswer.note.rawValue.dropLast()
        let selectedChoice = selectedChoice.rawValue
        return correctNote == selectedChoice
    }
    
    func isTheLeftArmFingerTheUserHasChosenCorrect(correctAnswer: NotesInformation, selectedChoice: LeftArmFingers) -> Bool {
        return correctAnswer.leftArmFinger.contains(selectedChoice)
    }
}
