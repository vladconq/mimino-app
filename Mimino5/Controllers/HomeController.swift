//
//  HomeController.swift
//  Mimino5
//
//  Created by Vladislav on 17.10.2021.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    // managers
    private let topicManager = TopicManager.shared
    private let scoreManager = ScoreManager.shared
    
    // controllers
    private var topicSelectionController = TopicSelectionController()
    
    // ui
    private let logoView = LogoView()
    
    private let scrollView = UIButtonScrollView()
    private let contentView = UIView()
    
    private let letterStackView = UIStackView()
    private let letterSectionBeginLabel = SectionBeginLabel(text: "ТРЕНИРОВКИ НА БУКВЫ")
    private let letterAlphabetButton = MenuButton(viewModel: MenuButtonViewModel(sectionTrainType: .letterAlphabet))
    private let letterQuizButton = MenuButton(viewModel: MenuButtonViewModel(sectionTrainType: .letterQuiz))
    private let letterMemoryButton = MenuButton(viewModel: MenuButtonViewModel(sectionTrainType: .letterMemory))
    
    private let wordStackView = UIStackView()
    private let wordSectionBeginLabel = SectionBeginLabel(text: "ТРЕНИРОВКИ НА СЛОВА")
    private let topicSelectionButton = TopicSelectionButton(viewModel: TopicSelectionButtonViewModel())
    private let wordQuizButton = MenuButton(viewModel: MenuButtonViewModel(sectionTrainType: .wordQuiz))
    private let wordMemoryButton = MenuButton(viewModel: MenuButtonViewModel(sectionTrainType: .wordMemory))
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureSelectors()
    }
    
    /*
     This feature allows to dynamically change the height of the logoView based on the height of safe area.
     */
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logoView.setHeight(height: view.safeAreaInsets.top + 40)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - UI
    
    func configureUI() {
        configureSelf()
        configureLogoView()
        configureScrollView()
        configureLetterSection()
        configureWordSection()
    }
    
    func configureSelf() {
        view.backgroundColor = .mainWhiteColor
        topicManager.delegate = self
        scoreManager.delegate = self
        logoView.delegate = self
    }
    
    func configureLogoView() {
        view.addSubview(logoView)
        logoView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
    }
    
    func configureScrollView() {
        scrollView.delaysContentTouches = false
        view.addSubview(scrollView)
        scrollView.anchor(top: logoView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: view.bottomAnchor)
        
        scrollView.addSubview(contentView)
        contentView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, right: scrollView.rightAnchor, bottom: scrollView.bottomAnchor)
        contentView.centerX(inView: scrollView)
    }
    
    func configureLetterSection() {
        for view in [letterSectionBeginLabel, letterAlphabetButton, letterQuizButton, letterMemoryButton] {
            letterStackView.addArrangedSubview(view)
        }
        
        letterStackView.axis = .vertical
        letterStackView.spacing = 10
        
        contentView.addSubview(letterStackView)
        letterStackView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor,
                               paddingTop: 30, paddingLeft: 25, paddingRight: 25)
    }
    
    func configureWordSection() {
        
        let trainStackView = UIStackView()
        trainStackView.addArrangedSubview(wordQuizButton)
        trainStackView.addArrangedSubview(wordMemoryButton)
        trainStackView.axis = .horizontal
        trainStackView.spacing = 10
        trainStackView.distribution = .fillEqually
        
        for view in [wordSectionBeginLabel, topicSelectionButton, trainStackView] {
            wordStackView.addArrangedSubview(view)
        }
        
        wordStackView.axis = .vertical
        wordStackView.spacing = 14
        
        contentView.addSubview(wordStackView)
        wordStackView.anchor(top: letterStackView.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor,
                             bottom: contentView.bottomAnchor, paddingTop: 30, paddingLeft: 25, paddingRight: 25, paddingBottom: 30)
    }
    
    // MARK: - Selectors
    
    func configureSelectors() {
        letterAlphabetButton.addTarget(self, action: #selector(handleLetterAlphabetButtonPressed), for: .touchUpInside)
        letterQuizButton.addTarget(self, action: #selector(handleLetterQuizButtonPressed), for: .touchUpInside)
        letterMemoryButton.addTarget(self, action: #selector(handleLetterMemoryButtonPressed), for: .touchUpInside)
        
        wordQuizButton.addTarget(self, action: #selector(handleWordQuizButtonPressed), for: .touchUpInside)
        wordMemoryButton.addTarget(self, action: #selector(handleWordMemoryButtonPressed), for: .touchUpInside)
        
        topicSelectionButton.addTarget(self, action: #selector(handleTopicSelectionButtonPressed), for: .touchUpInside)
    }
    
    @objc func handleLetterAlphabetButtonPressed() {
        let vc = AlphabetController()
        present(vc, animated: true, completion: nil)
    }
    
    @objc func handleLetterQuizButtonPressed() {
        let vc = TrainQuizController(sectionTrainType: .letterQuiz)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc func handleLetterMemoryButtonPressed() {
        let vc = TrainMemoryController(sectionTrainType: .letterMemory)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc func handleWordQuizButtonPressed() {
        let vc = TrainQuizController(sectionTrainType: .wordQuiz)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc func handleWordMemoryButtonPressed() {
        let vc = TrainMemoryController(sectionTrainType: .wordMemory)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc func handleTopicSelectionButtonPressed() {
        present(topicSelectionController, animated: true, completion: nil)
    }
    
}

extension HomeController: TopicManagerDelegate {
    func updateActiveTopicInfo() {
        topicSelectionButton.redrawView()
        wordQuizButton.redrawView()
        wordMemoryButton.redrawView()
    }
}

extension HomeController: ScoreManagerDelegate {
    func updateHighScore() {
        letterMemoryButton.redrawView()
        letterQuizButton.redrawView()
        wordQuizButton.redrawView()
        wordMemoryButton.redrawView()
        topicSelectionController.redrawTable()
    }
}

extension HomeController: LogoViewDelegate {
    
    func donateButtonPressed() {
        let vc = DonateController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func settingsButtonPressed() {
        let vc = SettingsController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
