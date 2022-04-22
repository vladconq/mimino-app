//
//  CardMemoryView.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import UIKit
import AudioToolbox

protocol CardMemoryViewDelegate {
    func handleAnswerPressed(answerType: AnswerType)
}

class CardMemoryView: UIView {
    
    // MARK: - Properties
    
    // init
    private let viewModel: CardMemoryViewModel
    
    // delegate
    var delegate: CardMemoryViewDelegate?
    
    // managers
    private let switchSettingsManager = SwitchSettingsManager.shared
    
    // ui
    private let originLabelBackView = UIView()
    
    private lazy var originLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.termOrigin
        label.font = viewModel.sectionTrainType == .letterMemory ? UIFont.systemFont(ofSize: 70) : UIFont.systemFont(ofSize: 50)
        label.textColor = .mainBlackColor
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let answerStack = UIStackView()
    
    private lazy var transliterationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainBlackColor.withAlphaComponent(0.5)
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = viewModel.termTransliteration
        label.textAlignment = .center
        return label
    }()
    
    private lazy var translationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainBlackColor.withAlphaComponent(0.5)
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = viewModel.termTranslation
        label.textAlignment = .center
        return label
    }()
    
    private lazy var audioButton: UIButton = {
        let button = AudioButton(color: viewModel.colorTheme)
        button.addTarget(self, action: #selector(handleAudioButtonPressed), for: .touchUpInside)
        button.setDimensions(height: 35, width: 35)
        return button
    }()
    
    private lazy var clarificationLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.textColor = .mainBlackColor.withAlphaComponent(0.5)
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = viewModel.exampleWordLabelAttributedText
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let askAnswerStack: UIStackView = {
        
        let stack = UIStackView()
        
        let tipLabel: UILabel = {
            let label = UILabel()
            label.textColor = .mainBlackColor.withAlphaComponent(0.5)
            label.font = UIFont.systemFont(ofSize: 15)
            label.text = "Вспомните верное произношение"
            label.textAlignment = .center
            return label
        }()
        
        let showAnswerButton: UIButton = {
            let button = CardButton(text: "Показать ответ", fontSize: 16)
            button.addTarget(self, action: #selector(handleShowAnswerButtonPressed), for: .touchUpInside)
            return button
        }()
        
        stack.addArrangedSubview(tipLabel)
        stack.addArrangedSubview(showAnswerButton)
        
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        
        return stack
    }()
    
    private let chooseAnswerStack: UIStackView = {
        
        let stack = UIStackView()
        stack.isHidden = true
        
        let knowButton: UIButton = {
            let button = CardButton(text: "знал", tag: AnswerType.correct.rawValue, fontSize: 18)
            button.addTarget(self, action: #selector(handleAnswerButtonPressed), for: .touchUpInside)
            return button
        }()
        
        let notKnowButton: UIButton = {
            let button = CardButton(text: "не знал", tag: AnswerType.wrong.rawValue, fontSize: 18)
            button.addTarget(self, action: #selector(handleAnswerButtonPressed), for: .touchUpInside)
            return button
        }()
        
        stack.addArrangedSubview(knowButton)
        stack.addArrangedSubview(notKnowButton)
        
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        
        return stack
    }()
    
    // MARK: - Lifecycle
    
    init(viewModel: CardMemoryViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    func configureUI() {
        configureSelf()
        configureAskAnswerStack()
        configureChooseAnswerStack()
        configureOriginLabelBackView()
        configureOriginLabel()
        configureAnswerStack()
        configureExampleWordLabel()
    }
    
    func configureSelf() {
        backgroundColor = .mainWhiteColor
        layer.cornerRadius = 10
    }
    
    func configureAskAnswerStack() {
        addSubview(askAnswerStack)
        askAnswerStack.anchor(left: leftAnchor, right: rightAnchor, bottom: bottomAnchor,
                              paddingLeft: 10, paddingRight: 10, paddingBottom: 10)
    }
    
    func configureChooseAnswerStack() {
        addSubview(chooseAnswerStack)
        chooseAnswerStack.anchor(left: leftAnchor, right: rightAnchor, bottom: bottomAnchor,
                                 paddingLeft: 10, paddingRight: 10, paddingBottom: 10)
    }
    
    func configureOriginLabelBackView() {
        addSubview(originLabelBackView)
        originLabelBackView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, bottom: askAnswerStack.topAnchor, paddingLeft: 20, paddingRight: 20)
    }
    
    func configureOriginLabel() {
        originLabelBackView.addSubview(originLabel)
        originLabel.anchor(left: originLabelBackView.leftAnchor, right: originLabelBackView.rightAnchor)
        originLabel.centerInSuperview()
    }
    
    func configureAnswerStack() {
        answerStack.isHidden = true
        
        switch viewModel.sectionTrainType {
        case .letterMemory:
            for view in [transliterationLabel, audioButton] {
                answerStack.addArrangedSubview(view)
            }
        case .wordMemory:
            for view in [translationLabel, audioButton] {
                answerStack.addArrangedSubview(view)
            }
        default:
            break
        }
        
        answerStack.axis = .horizontal
        answerStack.spacing = 14
        
        addSubview(answerStack)
        answerStack.anchor(top: originLabel.bottomAnchor, paddingTop: 15)
        answerStack.centerX(inView: self)
    }
    
    func configureExampleWordLabel() {
        addSubview(clarificationLabel)
        clarificationLabel.anchor(top: answerStack.bottomAnchor, paddingTop: 10)
        clarificationLabel.centerX(inView: self)
    }
    
    // MARK: - Selectors
    
    @objc func handleShowAnswerButtonPressed() {
        askAnswerStack.isHidden = true
        
        chooseAnswerStack.alpha = 0
        chooseAnswerStack.isHidden = false
        
        answerStack.alpha = 0
        answerStack.isHidden = false
        answerStack.transform = answerStack.transform.translatedBy(x: 0, y: -30)
        
        clarificationLabel.alpha = 0
        clarificationLabel.isHidden = false
        clarificationLabel.transform = clarificationLabel.transform.translatedBy(x: 0, y: -30)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut, .allowUserInteraction]) {
            self.chooseAnswerStack.alpha = 1
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .curveEaseOut) {
            self.answerStack.alpha = 1
            self.answerStack.transform = .identity
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .curveEaseOut) {
            self.clarificationLabel.alpha = 1
            self.clarificationLabel.transform = .identity
        }
        
        if switchSettingsManager.isOn(switchType: .autoPronunciation) {
            viewModel.playLetterSound()
        }
        
    }
    
    @objc func handleAnswerButtonPressed(sender: UIButton) {
        
        var answerType: AnswerType?
        
        if sender.tag == AnswerType.correct.rawValue {
            answerType = .correct
        } else {
            if switchSettingsManager.isOn(switchType: .vibration) {
                AudioServicesPlaySystemSound(1519)
            }
            answerType = .wrong
        }
        
//        viewModel.playAnswerSound(answerType: answerType!)
        
        delegate?.handleAnswerPressed(answerType: answerType!)
    }
    
    @objc func handleAudioButtonPressed() {
        viewModel.playLetterSound()
    }
    
}
