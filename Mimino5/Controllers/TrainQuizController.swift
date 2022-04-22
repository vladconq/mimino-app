//
//  TrainQuizController.swift
//  Mimino5
//
//  Created by Vladislav on 19.10.2021.
//

import UIKit

class TrainQuizController: UIViewController {
    
    // MARK: - Properties
    
    // init
    private let sectionTrainType: SectionTrainType
    
    // managers
    private let letterManager = LetterManager.shared
    private let topicManager = TopicManager.shared
    private let scoreManager = ScoreManager.shared
    private let switchSettingsManager = SwitchSettingsManager.shared
    
    // viewModels
    private lazy var scoreViewModel = ScoreViewModel(sectionTrainType: sectionTrainType)
    
    // ui
    private var answerType: AnswerType?
    
    private var topPanelView: TopPanelView?
    private var deckView = UIView()
    private var cardViews = [CardQuizView]()
    private var topCardView: CardQuizView?
    private var nextTopCardView: CardQuizView?
    
    private let passButton = TextButton(title: "не знаю", isHidden: false)
    private let continueButton = TextButton(title: "далее", isHidden: true)
    
    private lazy var tipView = TipView(sectionTrainType: sectionTrainType)
    
    private lazy var warningView = WarningView(colorTheme: sectionTrainType.colorTheme)
    
    private let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        let view = UIVisualEffectView(effect: blurEffect)
        return view
    }()
    
    // MARK: - Lifecycle
    
    init(sectionTrainType: SectionTrainType) {
        self.sectionTrainType = sectionTrainType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        injectData()
        configureUI()
    }
    
    // MARK: - Data
    
    func injectData() {
        var questions: [Question]?
        
        switch sectionTrainType {
        case .letterQuiz:
            questions = letterManager.getQuizQuestions()
        case .wordQuiz:
            questions = topicManager.getQuizQuestions()
        default:
            break
        }
        
        // configure TopPanelView
        self.topPanelView = TopPanelView(viewModel: TopPanelViewModel(terms: questions!))
        
        // configure DeckView
        let cardViewModels = questions?.map({ CardQuizViewModel(question: $0, sectionTrainType: sectionTrainType) })
        cardViewModels?.forEach { viewModel in
            let cardView = CardQuizView(viewModel: viewModel)
            cardView.delegate = self
            cardView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            deckView.addSubview(cardView)
            cardView.fillSuperview()
        }
        cardViews = self.deckView.subviews.map({ $0 as! CardQuizView })
        topCardView = self.cardViews.last
        topCardView?.transform = .identity
        
        nextTopCardView = self.cardViews[self.cardViews.count - 2]
        
        switch sectionTrainType {
        case .letterQuiz:
            break
        case .wordQuiz:
            if switchSettingsManager.isOn(switchType: .autoPronunciation) {
                topCardView?.viewModel.playLetterSound()
            }
        default:
            break
        }
    }
    
    // MARK: - UI
    
    func configureUI() {
        configureSelf()
        configureStackView()
        configureSelectors()
    }
    
    func configureSelf() {
        view.backgroundColor = sectionTrainType.colorTheme
        topPanelView?.delegate = self
        tipView.delegate = self
        warningView.delegate = self
    }
    
    func configureStackView() {
        let stack = UIStackView(arrangedSubviews: [topPanelView!, deckView, passButton, continueButton])
        stack.axis = .vertical
        stack.spacing = 15
        
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                     left: view.leftAnchor, right: view.rightAnchor,
                     bottom: view.safeAreaLayoutGuide.bottomAnchor,
                     paddingTop: 25, paddingLeft: 25, paddingRight: 25, paddingBottom: 40)
    }
    
    // MARK: - Selectors
    
    func configureSelectors() {
        continueButton.addTarget(self, action: #selector(handleContinueButtonPressed), for: .touchUpInside)
        passButton.addTarget(self, action: #selector(handlePassButtonPressed), for: .touchUpInside)
    }
    
    @objc func handleContinueButtonPressed() {
        swipeCard(answerType: answerType!)
        
        /*
         if there is only one card left, then we do not swipe it, we show the score on top of this card
         otherwise, we update the variables
         */
        if cardViews.count == 1 {
            showScoreView()
            scoreManager.updateHighScore(newScore: scoreViewModel.numberOfCorrectAnswers, sectionTrainType: sectionTrainType)
        } else {
            topPanelView?.viewModel.incrementCurrentIndex()
            cardViews.removeLast()
            topCardView = cardViews.last // set new topCardView
            nextTopCardView = cardViews.count > 1 ? cardViews[cardViews.count - 2] : cardViews[cardViews.count - 1]
            
            switch sectionTrainType {
            case .letterQuiz:
                break
            case .wordQuiz:
                if switchSettingsManager.isOn(switchType: .autoPronunciation) {
                    topCardView?.viewModel.playLetterSound()
                }
            default:
                break
            }
            
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1,
                           options: [.curveEaseOut, .allowUserInteraction]) {
                self.passButton.isHidden = false
                self.passButton.alpha = 1
                self.continueButton.isHidden = true
                self.continueButton.alpha = 0
            }
        }
        
    }
    
    @objc func handlePassButtonPressed(sender: UIButton) {
        topCardView?.handleAnswerButtonPressed(sender: sender)
    }
    
    // MARK: - Helpers
    
    func swipeCard(answerType: AnswerType) {
        UIView.animate(withDuration: 0.8, delay: 0, options: [.curveEaseOut, .allowUserInteraction]) {
            self.topCardView?.transform = (self.topCardView?.transform.translatedBy(x: answerType == .correct ? 700: -700, y: 0))!
            if self.cardViews.count != 1 {
                self.topCardView?.backgroundColor = answerType == .correct ? UIColor.systemGreen: UIColor.systemRed
            }
            self.nextTopCardView?.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    func showScoreView() {
        let scoreView = ScoreView(viewModel: scoreViewModel)
        scoreView.delegate = self
        
        view.addSubview(visualEffectView)
        visualEffectView.fillSuperview()
        visualEffectView.alpha = 0
        
        view.addSubview(scoreView)
        scoreView.setWidth(width: view.frame.width - 80)
        scoreView.centerInSuperview()
        scoreView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        scoreView.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            self.visualEffectView.alpha = 1
            scoreView.alpha = 1
            scoreView.transform = CGAffineTransform.identity
        }
    }
    
}

// MARK: - CardViewDelegate

extension TrainQuizController: CardQuizViewDelegate {
    func handleAnswerPressed(answerType: AnswerType) {
        
        self.answerType = answerType
        
        switch answerType {
        case .correct:
            scoreViewModel.incrementNumberOfCorrectAnswers()
        case .wrong:
            scoreViewModel.incrementNumberOfWrongAnswers()
        case .skipped:
            scoreViewModel.incrementNumberOfSkippedAnswers()
        }
        
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: [.curveEaseOut, .allowUserInteraction]) {
            self.passButton.isHidden = true
            self.passButton.alpha = 0
            self.continueButton.isHidden = false
            self.continueButton.alpha = 1
            
            if self.cardViews.count == 1 {
                self.continueButton.setTitle("закончить", for: .normal)
            }
        }
    }
}

extension TrainQuizController: TopPanelViewDelegate {

    func handleDismissButtonPressed() {
        
        if scoreViewModel.numberOfCorrectAnswers == 0 {
            dismiss(animated: true, completion: nil)
        }
        
        view.addSubview(visualEffectView)
        visualEffectView.fillSuperview()
        visualEffectView.alpha = 0
        
        view.addSubview(warningView)
        warningView.setWidth(width: view.frame.width - 80)
        warningView.centerInSuperview()
        warningView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        warningView.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            self.visualEffectView.alpha = 1
            self.warningView.alpha = 1
            self.warningView.transform = CGAffineTransform.identity
        }
    }
    
    func handleInfoButtonPressed() {
        view.addSubview(visualEffectView)
        visualEffectView.fillSuperview()
        visualEffectView.alpha = 0
        
        view.addSubview(tipView)
        tipView.setWidth(width: view.frame.width - 80)
        tipView.centerInSuperview()
        tipView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        tipView.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            self.visualEffectView.alpha = 1
            self.tipView.alpha = 1
            self.tipView.transform = CGAffineTransform.identity
        }
    }
    
}

// MARK: - TipViewDelegate

extension TrainQuizController: TipViewDelegate {
    func closeTipView() {
        UIView.animate(withDuration: 0.3) {
            self.visualEffectView.alpha = 0
            self.tipView.alpha = 0
            self.tipView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        } completion: { (_) in
            self.tipView.removeFromSuperview()
        }
    }
}

// MARK: - WarningView

extension TrainQuizController: WarningViewDelegate {
    func continueTrain() {
        UIView.animate(withDuration: 0.3) {
            self.visualEffectView.alpha = 0
            self.warningView.alpha = 0
            self.warningView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        } completion: { (_) in
            self.warningView.removeFromSuperview()
        }
    }
    
    func exitTrain() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - ScoreViewDelegate

extension TrainQuizController: ScoreViewDelegate {
    func closeScoreView() {
        dismiss(animated: true, completion: nil)
    }
}
