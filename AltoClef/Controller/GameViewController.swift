//
//  GameViewController.swift
//  AltoClef
//
//  Created by Khalil AlNajjar on 25/04/2022.
//

import UIKit

class GameViewController: UIViewController {
    
    lazy var viewModel: GameViewModel = {
        let viewModel = GameViewModel()
        return viewModel
    }()
    
    var randomNoteInformation: NotesInformation! {
        didSet {
            noteImageView.image = randomNoteInformation.notePicture
        }
    }
    
    private let noteChoices = NotesWithoutOctaves.allCases.map({ $0.rawValue })
    private let leftArmFingersChoices = LeftArmFingers.allCases.map({ $0.rawValue })
    
    let startTheGameButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start The Game", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(didPressStartTheGameButton), for: .touchUpInside)
        return button
    }()
    
    let checkButton: UIButton = {
        let button = UIButton()
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Check", for: .normal)
        button.setTitleColor(UIColor.init(white: 1, alpha: 1.0), for: .normal)
        button.setTitleColor(UIColor.init(white: 1, alpha: 0.3), for: .disabled)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(didPressCheckButton), for: .touchUpInside)
        return button
    }()
    
    lazy var noteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var noteChoicesView: ChoicesView = {
        let choices = noteChoices
        let choicesView = ChoicesView(choices: choices)
        choicesView.didSelectAnItem = {
            self.checkIfButtonShouldBeEnables()
        }
        choicesView.translatesAutoresizingMaskIntoConstraints = false
        return choicesView
    }()
    
    lazy var leftArmChoicesView: ChoicesView = {
        let choices = leftArmFingersChoices
        let choicesView = ChoicesView(choices: choices)
        choicesView.didSelectAnItem = {
            self.checkIfButtonShouldBeEnables()
        }
        choicesView.translatesAutoresizingMaskIntoConstraints = false
        return choicesView
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "0"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initStartTheGameButton()
    }
    
    private func initStartTheGameButton() {
        view.addSubview(startTheGameButton)
        startTheGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startTheGameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc private func didPressStartTheGameButton() {
        startTheGameButton.removeFromSuperview()
        getRandomNoteInformation()
        initNoteImageView()
        initNoteChoicesView()
        initLeftArmChoicesView()
        initCheckButton()
        initResultLabel()
    }
    
    private func getRandomNoteInformation() {
        randomNoteInformation = viewModel.getRandomNoteInformation()
    }
    
    private func initNoteImageView() {
        view.addSubview(noteImageView)
        noteImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        noteImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noteImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        noteImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func initNoteChoicesView() {
        view.addSubview(noteChoicesView)
        noteChoicesView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        noteChoicesView.topAnchor.constraint(equalTo: noteImageView.bottomAnchor, constant: 75).isActive = true
        noteChoicesView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noteChoicesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        noteChoicesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
    }
    
    private func initLeftArmChoicesView() {
        view.addSubview(leftArmChoicesView)
        leftArmChoicesView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        leftArmChoicesView.topAnchor.constraint(equalTo: noteChoicesView.bottomAnchor, constant: 50).isActive = true
        leftArmChoicesView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        leftArmChoicesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        leftArmChoicesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
    }
    
    private func initCheckButton() {
        view.addSubview(checkButton)
        checkButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        checkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        checkButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35).isActive = true
    }
    
    private func initResultLabel() {
        view.addSubview(resultLabel)
        resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
    }
    
    @objc private func didPressCheckButton() {
        if areBothQuestionsAnsweredCorrectly() {
            animateResultAndChangeItsValue(isAnsweredCorrectly: true)
        } else {
            animateResultAndChangeItsValue(isAnsweredCorrectly: false)
        }
        getRandomNoteInformation()
    }
    
    private func animateResultAndChangeItsValue(isAnsweredCorrectly: Bool) {
        let currentResult = Int(resultLabel.text ?? "") ?? 0
        let animationDuration = 0.5
        UIView.transition(with: resultLabel, duration: animationDuration, options: .transitionCrossDissolve, animations: {
            self.resultLabel.textColor = isAnsweredCorrectly ? .green : .red
            self.resultLabel.text = "\(currentResult + (isAnsweredCorrectly ? 1 : -1))"
        }, completion: { finished in
            UIView.transition(with: self.resultLabel, duration: animationDuration, options: .transitionCrossDissolve, animations: {
                self.resultLabel.textColor = .black
            })
        })
    }
    
    private func areBothQuestionsAnsweredCorrectly() -> Bool {
        if let selectedChoiceIndexForFirstQuestion = noteChoicesView.getIndexForSelectedItem(),
           let selectedChoiceIndexForSecondQuestion = leftArmChoicesView.getIndexForSelectedItem(),
           let selectedNote = NotesWithoutOctaves(rawValue: noteChoices[selectedChoiceIndexForFirstQuestion]),
           let selectedLeftAraFinger = LeftArmFingers(rawValue: leftArmFingersChoices[selectedChoiceIndexForSecondQuestion]) {
            let isFirstQuestionCorrect = viewModel.isTheNoteTheUserHasChosenCorrect(correctAnswer: randomNoteInformation, selectedChoice: selectedNote)
            let isSecondQuestionCorrect = viewModel.isTheLeftArmFingerTheUserHasChosenCorrect(correctAnswer: randomNoteInformation, selectedChoice: selectedLeftAraFinger)
            return isFirstQuestionCorrect && isSecondQuestionCorrect
        }
        return false
    }
    
    private func checkIfButtonShouldBeEnables() {
        let isFirstQuestionAnswered = noteChoicesView.getIndexForSelectedItem() != nil
        let isSecondQuestionAnswered = leftArmChoicesView.getIndexForSelectedItem() != nil
        checkButton.isEnabled = isFirstQuestionAnswered && isSecondQuestionAnswered
    }
}

#if DEBUG
extension GameViewController {
    func exposePrivateInitStartButton() {
        self.initStartTheGameButton()
    }
}
#endif
