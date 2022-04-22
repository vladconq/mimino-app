//
//  ScoreView.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import UIKit

protocol ScoreViewDelegate {
    func closeScoreView()
}

class ScoreView: UIView {
    
    // MARK: - Properties
    
    // init
    let viewModel: ScoreViewModel
    
    // delegate
    var delegate: ScoreViewDelegate?
    
    // ui
    private var scoreStack = UIStackView()
    private let cornerRadius: CGFloat = 15
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainWhiteColor
        view.layer.cornerRadius = cornerRadius
        view.alpha = 0.4
        return view
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.headerLabelText
        label.textColor = .mainBlackColor
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = viewModel.sectionTrainType.colorTheme
        button.setTitle("Закончить тренировку", for: .normal)
        button.layer.cornerRadius = 5
        button.tintColor = .mainWhiteColor
        button.titleLabel?.font = UIFont(name: Fonts.robotoRegular, size: 16)
        button.addTarget(self, action: #selector(handleCloseButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    init(viewModel: ScoreViewModel) {
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
        configureBackView()
        configureHeaderLabel()
        configureCloseButton()
        configureScoreStack()
    }
    
    func configureSelf() {
        layer.cornerRadius = 10
    }
    
    func configureBackView() {
        backView.applyShadow(opacity: 0.2, radius: 15, offset: CGSize(width: 0, height: 0), color: .black)
        addSubview(backView)
        backView.fillSuperview()
    }
    
    func configureHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 20, paddingRight: 20)
        headerLabel.centerX(inView: self)
    }
    
    func configureCloseButton() {
        addSubview(closeButton)
        closeButton.setHeight(height: 50)
        closeButton.anchor(left: leftAnchor, right: rightAnchor, bottom: backView.bottomAnchor,
                           paddingLeft: 16, paddingRight: 16, paddingBottom: 16)
    }
    
    func configureScoreStack() {
        
        switch viewModel.sectionTrainType {
        case .letterQuiz, .wordQuiz:
            scoreStack = UIStackView(arrangedSubviews: [ScoreItem(scoreValue: viewModel.numberOfCorrectAnswers, scoreText: "верно"),
                                                        ScoreItem(scoreValue: viewModel.numberOfWrongAnswers, scoreText: "неверно"),
                                                        ScoreItem(scoreValue: viewModel.numberOfSkippedAnswers, scoreText: "не знаю")])
        case .letterMemory, .wordMemory:
            scoreStack = UIStackView(arrangedSubviews: [ScoreItem(scoreValue: viewModel.numberOfCorrectAnswers, scoreText: "знаю"),
                                                        ScoreItem(scoreValue: viewModel.numberOfWrongAnswers, scoreText: "не знаю")])
        default:
            break
        }
        
        scoreStack.axis = .horizontal
        scoreStack.distribution = .fillEqually
        addSubview(scoreStack)
        scoreStack.anchor(top: headerLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, bottom: closeButton.topAnchor,
                          paddingTop: 15, paddingLeft: 15, paddingRight: 15, paddingBottom: 30)
    }
    
    // MARK: - Selectors
    
    @objc func handleCloseButtonPressed() {
        delegate?.closeScoreView()
    }
    
}
