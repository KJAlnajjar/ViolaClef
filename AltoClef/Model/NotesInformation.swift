//
//  NotesInformation.swift
//  AltoClef
//
//  Created by Khalil AlNajjar on 27/04/2022.
//

import Foundation
import UIKit

struct NotesInformation {
    
    static var data: [NotesInformation] {
        var arrayOfNotesInformation = [NotesInformation]()
        for note in Notes.allCases {
            let noteInformation = NotesInformation(note: note, leftArmFinger: getLeftArmFinger(using: note), notePicture: getUIImage(using: note))
            arrayOfNotesInformation.append(noteInformation)
        }
        return arrayOfNotesInformation
    }
    
    let note: Notes
    let leftArmFinger: [LeftArmFingers]
    let notePicture: UIImage
    
    private static func getUIImage(using noteName: Notes) -> UIImage {
        return UIImage(named: noteName.rawValue) ?? UIImage()
    }
    
    private static func getLeftArmFinger(using noteName: Notes) -> [LeftArmFingers] {
        let gameViewModel = GameViewModel()
        return gameViewModel.getLeftArmFinger(using: noteName)
    }
}
