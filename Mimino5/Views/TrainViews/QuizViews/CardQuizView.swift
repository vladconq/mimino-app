//
//  CardQuizView.swift
//  Mimino5
//
//  Created by Vladislav on 19.10.2021.
//

import UIKit
import AudioToolbox

protocol CardQuizViewDelegate {
    func handleAnswerPressed(answerType: AnswerType)
}

class CardQuizView: UIView {
    
    // MARK: - Properties
    
    // init
    let viewModel: CardQuizViewModel
    
    // managers
    private let tipManager = TipManager.shared
    private let switchSettingsManager = SwitchSettingsManager.shared
    
    // delegate
    var delegate: CardQuizViewDelegate?
    
    // ui
    private var answerType: AnswerType?
    
    private let questionLabelBackView = UIView()
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.getQuestion().text
        label.font = viewModel.sectionTrainType == .letterQuiz ? UIFont.systemFont(ofSize: 70) : UIFont.systemFont(ofSize: 50)
        label.textColor = .mainBlackColor
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let answersStackView = UIStackView()
    private lazy var answerButton1 = CardButton(text: viewModel.getQuestion().answers[0].text, tag: 1, fontSize: viewModel.answerFontSize!)
    private lazy var answerButton2 = CardButton(text: viewModel.getQuestion().answers[1].text, tag: 2, fontSize: viewModel.answerFontSize!)
    private lazy var answerButton3 = CardButton(text: viewModel.getQuestion().answers[2].text, tag: 3, fontSize: viewModel.answerFontSize!)
    private lazy var answerButton4 = CardButton(text: viewModel.getQuestion().answers[3].text, tag: 4, fontSize: viewModel.answerFontSize!)
    
    private let spacer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.setHeight(height: 15)
        return view
    }()
    
    private lazy var audioButton: UIButton = {
        let button = AudioButton(color: viewModel.colorTheme)
        button.addTarget(self, action: #selector(handleAudioButtonPressed), for: .touchUpInside)
        button.setDimensions(height: 35, width: 35)
        return button
    }()
    
    private lazy var tipLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainBlackColor.withAlphaComponent(0.5)
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = viewModel.sectionTrainType == .letterQuiz ? "Выберите верное произношение" : "Выберите верный перевод"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    // MARK: - Lifecycle
    
    init(viewModel: CardQuizViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        configureUI()
        configureSelectors()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    func configureUI() {
        configureSelf()
        configureAnswers()
        configureQuestionLabelBackView()
        configureQuestionLabel()
        configureAudioButton()
    }
    
    func configureSelf() {
        backgroundColor = .mainWhiteColor
        layer.cornerRadius = 10
    }
    
    func configureQuestionLabelBackView() {
        addSubview(questionLabelBackView)
        questionLabelBackView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, bottom: answersStackView.topAnchor, paddingLeft: 20, paddingRight: 20)
    }
    
    func configureQuestionLabel() {
        questionLabelBackView.addSubview(questionLabel)
        questionLabel.anchor(left: questionLabelBackView.leftAnchor, right: questionLabelBackView.rightAnchor)
        questionLabel.centerInSuperview()
    }
    
    func configureAudioButton() {
        switch viewModel.sectionTrainType {
        case .letterQuiz:
            return
        case .wordQuiz:
            questionLabelBackView.addSubview(audioButton)
            audioButton.anchor(top: questionLabel.bottomAnchor, paddingTop: 15)
            audioButton.centerX(inView: self)
        default:
            break
        }

    }
    
    func configureAnswers() {
        [tipLabel, spacer, answerButton1, answerButton2, answerButton3, answerButton4].forEach {
            view in answersStackView.addArrangedSubview(view)
        }
        
        answersStackView.axis = .vertical
        answersStackView.distribution = .fill
        answersStackView.spacing = 5
        
        addSubview(answersStackView)
        answersStackView.anchor(left: leftAnchor, right: rightAnchor, bottom: bottomAnchor,
                                paddingLeft: 10, paddingRight: 10, paddingBottom: 10)
    }
    
    // MARK: - Selectors
    
    func configureSelectors() {
        answerButton1.addTarget(self, action: #selector(handleAnswerButtonPressed(sender:)), for: .touchUpInside)
        answerButton2.addTarget(self, action: #selector(handleAnswerButtonPressed(sender:)), for: .touchUpInside)
        answerButton3.addTarget(self, action: #selector(handleAnswerButtonPressed(sender:)), for: .touchUpInside)
        answerButton4.addTarget(self, action: #selector(handleAnswerButtonPressed(sender:)), for: .touchUpInside)
    }
    
    @objc func handleAnswerButtonPressed(sender: UIButton) {
        
        let rightAnswerButton = viewWithTag(viewModel.correctAnswerIndex + 1) as? UIButton
        
        if viewModel.checkAnswer(selectedAnswerIndex: sender.tag - 1) {
            sender.backgroundColor = .systemGreen
            sender.setTitleColor(.mainWhiteColor, for: .normal)
            answerType = .correct
            updateTipLabel()
        } else if sender.tag == 0 {
            if viewModel.sectionTrainType == .letterQuiz {
                viewModel.playLetterSound()
            }
            rightAnswerButton?.backgroundColor = .systemOrange
            rightAnswerButton?.setTitleColor(.mainWhiteColor, for: .normal)
            rightAnswerButton?.applyShakeAnimation()
            if switchSettingsManager.isOn(switchType: .vibration) {
                AudioServicesPlaySystemSound(1519)
            }
            answerType = .skipped
            updateTipLabel()
            
        } else {
            if viewModel.sectionTrainType == .letterQuiz {
                viewModel.playLetterSound()
            }
            sender.backgroundColor = .systemRed
            sender.setTitleColor(.mainWhiteColor, for: .normal)
            sender.applyShakeAnimation()
            rightAnswerButton?.backgroundColor = .systemGreen
            rightAnswerButton?.setTitleColor(.mainWhiteColor, for: .normal)
            if switchSettingsManager.isOn(switchType: .vibration) {
                AudioServicesPlaySystemSound(1519)
            }
            answerType = .wrong
            updateTipLabel()
        }
        
        for view in answersStackView.subviews {
            if view is UIButton {
                let button = view as? UIButton
                button?.isEnabled = false
                button?.alpha = 0.6
            }
        }
        
        rightAnswerButton?.alpha = 1
        
//        viewModel.playAnswerSound(answerType: answerType!)
        
        delegate?.handleAnswerPressed(answerType: answerType!)
    }
    
    // MARK: - Helpers
    
    func updateTipLabel() {
        var newTipLabelText: String
        
        switch answerType {
        case .correct:
            newTipLabelText = tipManager.getRandomPositiveTip()
        case .wrong:
            newTipLabelText = tipManager.getRandomNegativeTip()
        case .skipped:
            newTipLabelText = tipManager.getRandomSkippedTip()
        case .none:
            newTipLabelText = ""
        }
        
        tipLabel.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.tipLabel.text = ""
            self.tipLabel.alpha = 1
            self.tipLabel.text = newTipLabelText
        }
    }
    
    @objc func handleAudioButtonPressed() {
        viewModel.playLetterSound()
    }
    
}

