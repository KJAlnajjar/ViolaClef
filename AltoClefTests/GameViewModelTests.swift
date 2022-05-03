//
//  AltoClefTests.swift
//  AltoClefTests
//
//  Created by Khalil AlNajjar on 25/04/2022.
//

import XCTest
@testable import AltoClef

class GameViewModelTests: XCTestCase {
    
    var sut: GameViewModel!
    
    override func setUp() {
        super.setUp()
        sut = GameViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_C3Note_toBeAssignedToOpenString_equal() {
        let openString = sut.getLeftArmFinger(using: .C3)
        XCTAssertEqual(openString.first, .openString)
    }

    func test_D3Note_toBeAssignedToOpenString_notEqual() {
        let firstFinger = sut.getLeftArmFinger(using: .D3)
        XCTAssertNotEqual(firstFinger.first, .openString)
    }

    func test_D3Note_toBeAssignedToSecondFinger_notEqual() {
        let firstFinger = sut.getLeftArmFinger(using: .D3)
        XCTAssertNotEqual(firstFinger.first, .secondFinger)
    }
    
    func test_E3Note_toBeAssignedToSecondfinger_equal() {
        let secondFinger = sut.getLeftArmFinger(using: .E3)
        XCTAssertEqual(secondFinger.first, .secondFinger)
    }
    
    func test_F3Note_toBeAssignedToThirdFinger_equal() {
        let thirdFinger = sut.getLeftArmFinger(using: .F3)
        XCTAssertEqual(thirdFinger.first, .thirdFinger)
    }
    
    func test_G3Note_toBeAssignedToForthFinger_true() {
        let arrayOfStrings = sut.getLeftArmFinger(using: .G3)
        let containsForthFinger = arrayOfStrings.contains(where: { $0 == .forthFinger })
        XCTAssertTrue(containsForthFinger)
    }
    
    func test_G3Note_toBeAssignedToOpenString_true() {
        let arrayOfStrings = sut.getLeftArmFinger(using: .G3)
        let containsOpenString = arrayOfStrings.contains(where: { $0 == .openString })
        XCTAssertTrue(containsOpenString)
    }
    
    func test_A3Note_toBeAssignedToFirstFinger_equal() {
        let firstFinger = sut.getLeftArmFinger(using: .A3)
        XCTAssertEqual(firstFinger.first, .firstFinger)
    }
    
    func test_B3Note_toBeAssignedToSecondFinger_equal() {
        let secondFinger = sut.getLeftArmFinger(using: .B3)
        XCTAssertEqual(secondFinger.first, .secondFinger)
    }
    
    func test_C4Note_toBeAssignedToThirdFinger_equal() {
        let thirdFinger = sut.getLeftArmFinger(using: .C4)
        XCTAssertEqual(thirdFinger.first, .thirdFinger)
    }
    
    func test_D4Note_toBeAssignedToForthFinger_true() {
        let arrayOfStrings = sut.getLeftArmFinger(using: .D4)
        let containsForthFinger = arrayOfStrings.contains(where: { $0 == .forthFinger })
        XCTAssertTrue(containsForthFinger)
    }
    
    func test_D4Note_toBeAssignedToOpenString_true() {
        let arrayOfStrings = sut.getLeftArmFinger(using: .D4)
        let containsOpenString = arrayOfStrings.contains(where: { $0 == .openString })
        XCTAssertTrue(containsOpenString)
    }
    
    func test_E4Note_toBeAssignedToFirstFinger_equal() {
        let firstFinger = sut.getLeftArmFinger(using: .E4)
        XCTAssertEqual(firstFinger.first, .firstFinger)
    }
    
    func test_F4Note_toBeAssignedToSecondFinger_equal() {
        let secondFinger = sut.getLeftArmFinger(using: .F4)
        XCTAssertEqual(secondFinger.first, .secondFinger)
    }
    
    func test_G4Note_toBeAssignedToThirdFinger_equal() {
        let thirdFinger = sut.getLeftArmFinger(using: .G4)
        XCTAssertEqual(thirdFinger.first, .thirdFinger)
    }
    
    func test_A4Note_toBeAssignedToForthFinger_true() {
        let arrayOfStrings = sut.getLeftArmFinger(using: .A4)
        let containsForthFinger = arrayOfStrings.contains(where: { $0 == .forthFinger })
        XCTAssertTrue(containsForthFinger)
    }
    
    func test_A4Note_toBeAssignedToOpenString_true() {
        let arrayOfStrings = sut.getLeftArmFinger(using: .A4)
        let containsOpenString = arrayOfStrings.contains(where: { $0 == .openString })
        XCTAssertTrue(containsOpenString)
    }
    
    func test_B4Note_toBeAssignedToFirstFinger_equal() {
        let firstFinger = sut.getLeftArmFinger(using: .B4)
        XCTAssertEqual(firstFinger.first, .firstFinger)
    }
    
    func test_C5Note_toBeAssignedToSecondFinger_equal() {
        let secondFinger = sut.getLeftArmFinger(using: .C5)
        XCTAssertEqual(secondFinger.first, .secondFinger)
    }
    
    func test_D5Note_toBeAssignedToThirdFinger_equal() {
        let thirdFinger = sut.getLeftArmFinger(using: .D5)
        XCTAssertEqual(thirdFinger.first, .thirdFinger)
    }
    
    func test_E5Note_toBeAssignedToForthFinger_true() {
        let arrayOfStrings = sut.getLeftArmFinger(using: .E5)
        let containsForthFinger = arrayOfStrings.contains(where: { $0 == .forthFinger })
        XCTAssertTrue(containsForthFinger)
    }
    
    func test_E5Note_toBeAssignedToOpenString_true() {
        let arrayOfStrings = sut.getLeftArmFinger(using: .E5)
        let containsOpenString = arrayOfStrings.contains(where: { $0 == .openString })
        XCTAssertTrue(containsOpenString)
    }
    
    func test_makeSureTheNumberOfNotesInformationIsEqualToTheNotes_true() {
        let getAllNotesInformation = sut.getAllNotesInformation()
        XCTAssertEqual(getAllNotesInformation.count, Notes.allCases.count)
    }
    
    func test_getRandomObjectFromNotesInformationModel_NotNil() {
        let randomNoteInformation = sut.getRandomNoteInformation()
        XCTAssertNotNil(randomNoteInformation)
    }
    
    func test_getAllNotesWithoutDuplication_ShouldBe7Notes() {
        let notes = sut.getAllNotesWithoutDuplication()
        XCTAssertEqual(notes.count, 7)
    }
    
    func test_isTheNoteTheUserHasChosenCorrect_true() {
        let correctAnswer = getANoreInformation()
        let selectedChoice = NotesWithoutOctaves.E
        let isTheNoteTheUserHasChosenCorrect = sut.isTheNoteTheUserHasChosenCorrect(correctAnswer: correctAnswer, selectedChoice: selectedChoice)
        XCTAssertTrue(isTheNoteTheUserHasChosenCorrect)
    }
    
    func test_isTheLeftArmFingerTheUserHasChosenCorrect_true() {
        let correctAnswer = getANoreInformation()
        let selectedChoice = LeftArmFingers.openString
        let isTheLeftArmFingerTheUserHasChosenCorrect = sut.isTheLeftArmFingerTheUserHasChosenCorrect(correctAnswer: correctAnswer, selectedChoice: selectedChoice)
        XCTAssertTrue(isTheLeftArmFingerTheUserHasChosenCorrect)
    }
    
    func test_isTheLeftArmFingerTheUserHasChosenCorrect_secondChoiceTrue() {
        let correctAnswer = getANoreInformation()
        let selectedChoice = LeftArmFingers.forthFinger
        let isTheLeftArmFingerTheUserHasChosenCorrect = sut.isTheLeftArmFingerTheUserHasChosenCorrect(correctAnswer: correctAnswer, selectedChoice: selectedChoice)
        XCTAssertTrue(isTheLeftArmFingerTheUserHasChosenCorrect)
    }
}
