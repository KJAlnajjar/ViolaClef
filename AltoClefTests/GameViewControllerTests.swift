//
//  GameViewControllerTests.swift
//  AltoClefTests
//
//  Created by Khalil AlNajjar on 26/04/2022.
//

import XCTest
@testable import AltoClef

class GameViewControllerTests: XCTestCase {
    
    var sut: GameViewController!

    override func setUp() {
        super.setUp()
        sut = GameViewController()
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_startTheGameButton_isShowingWhenOpenTheApp_true() {
        sut.exposePrivateInitStartButton()
        let isButtonShowing = sut.view.contains(sut.startTheGameButton)
        XCTAssertTrue(isButtonShowing)
    }
    
    func test_removeStartTheGameButton_whenClicked_isRemovedTrue() {
        let button = sut.startTheGameButton
        tap(button)
        let isButtonShowing = sut.view.contains(button)
        XCTAssertFalse(isButtonShowing)
    }
    
    func test_showTheNoteImageView_whenStartTheGameButtonClicked_imageViewHasSuperView() {
        tap(sut.startTheGameButton)
        let isImageViewShowing = sut.view.contains(sut.noteImageView)
        XCTAssertTrue(isImageViewShowing)
    }
    
    func test_noteInformation_notNilWhenButtonClicked() {
        tap(sut.startTheGameButton)
        XCTAssertNotNil(sut.randomNoteInformation)
    }
    
    func test_ImageViewShouldHaveAnImage_true() {
        tap(sut.startTheGameButton)
        XCTAssertNotNil(sut.noteImageView.image)
    }
    
    func test_showTheNoteChoicesView_whenStartTheGameButtonClicked_noteChoicesViewHasSuperView() {
        tap(sut.startTheGameButton)
        let isNoteChoicesViewShowing = sut.view.contains(sut.noteChoicesView)
        XCTAssertTrue(isNoteChoicesViewShowing)
    }
    
    func test_showTheLeftArmChoicesView_whenStartTheGameButtonClicked_leftArmChoicesViewHasSuperView() {
        tap(sut.startTheGameButton)
        let isLeftArmChoicesViewShowing = sut.view.contains(sut.leftArmChoicesView)
        XCTAssertTrue(isLeftArmChoicesViewShowing)
    }
    
    func test_showTheCheckButton_whenStartTheGameButtonClicked_checkButtonHasSuperView() {
        tap(sut.startTheGameButton)
        let isCheckButtonShowing = sut.view.contains(sut.checkButton)
        XCTAssertTrue(isCheckButtonShowing)
    }
    
    func test_checkButtonShouldBeDisabled_WhenNoNoteHasBeenSelected_disabled() {
        tap(sut.startTheGameButton)
        let isCheckButtonDisabled = sut.checkButton.isEnabled
        XCTAssertFalse(isCheckButtonDisabled)
    }
    
    func test_checkButtonShouldBeDisabled_WhenOnlyFirstQuestionSelected_disabled() {
        tap(sut.startTheGameButton)
        let collectionView = sut.noteChoicesView.collectionView
        selectItem(in: collectionView, item: 0)
        didSelectItem(in: collectionView, item: 0)
        let isCheckButtonEnabled = sut.checkButton.isEnabled
        XCTAssertFalse(isCheckButtonEnabled)
    }
    
    func test_checkButtonShouldBeDisabled_WhenOnlySecondQuestionSelected_disabled() {
        tap(sut.startTheGameButton)
        let collectionView = sut.leftArmChoicesView.collectionView
        selectItem(in: collectionView, item: 0)
        didSelectItem(in: collectionView, item: 0)
        let isCheckButtonEnabled = sut.checkButton.isEnabled
        XCTAssertFalse(isCheckButtonEnabled)
    }
    
    func test_checkButtonShouldBeEnabled_WhenBothquestionsSelected_enabled() {
        tap(sut.startTheGameButton)
        answerBothQuestions()
        let isCheckButtonEnabled = sut.checkButton.isEnabled
        XCTAssertTrue(isCheckButtonEnabled)
    }
    
    func test_showResultLabel_whenStartTheGameButtonClicked_resultHasSuperView() {
        tap(sut.startTheGameButton)
        let isResultLabelShowing = sut.view.contains(sut.resultLabel)
        XCTAssertTrue(isResultLabelShowing)
    }
    
    func test_resultLabelShouldBeZero_whenStartTheGameButtonClicked_true() {
        tap(sut.startTheGameButton)
        let resultLabel = sut.resultLabel
        XCTAssertEqual(resultLabel.text, "0")
    }
    
    func test_resultLabelShouldnotBeOne_whenAnsweringbothQuestions() {
        tap(sut.startTheGameButton)
        sut.randomNoteInformation = getANoreInformation()
        answerBothQuestions()
        tap(sut.checkButton)
        let resultLabel = sut.resultLabel
        XCTAssertNotEqual(resultLabel.text, "0")
    }
    
    private func answerBothQuestions(for firstQuestion: Int = 0, secondQuestion: Int = 0) {
        let notesCollectionView = sut.noteChoicesView.collectionView
        selectItem(in: notesCollectionView, item: firstQuestion)
        didSelectItem(in: notesCollectionView, item: firstQuestion)
        let leftArmCollectionView = sut.leftArmChoicesView.collectionView
        selectItem(in: leftArmCollectionView, item: secondQuestion)
        didSelectItem(in: leftArmCollectionView, item: secondQuestion)
    }
}
