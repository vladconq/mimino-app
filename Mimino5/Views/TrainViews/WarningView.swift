//
//  WarningView.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import UIKit

protocol WarningViewDelegate {
    func continueTrain()
    func exitTrain()
}

class WarningView: UIView {
    
    // MARK: - Properties
    
    private var colorTheme: UIColor?
    var delegate: WarningViewDelegate?
    
    private let cornerRadius: CGFloat = 15
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainWhiteColor
        view.layer.cornerRadius = cornerRadius
        view.alpha = 0.4
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainBlackColor.withAlphaComponent(0.6)
        label.text = "Вы действительно хотите выйти из тренировки? Текущий результат будет сброшен."
        label.font = UIFont(name: Fonts.robotoRegular, size: 17)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    private lazy var continueTrainButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = colorTheme
        button.setTitle("Вернуться в тренировку", for: .normal)
        button.layer.cornerRadius = 5
        button.tintColor = .mainWhiteColor
        button.titleLabel?.font = UIFont(name: Fonts.robotoRegular, size: 16)
        button.addTarget(self, action: #selector(handleContinueTrainButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var exitTrainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Выйти из тренировки", for: .normal)
        button.layer.cornerRadius = 5
        button.tintColor = colorTheme
        button.titleLabel?.font = UIFont(name: Fonts.robotoRegular, size: 16)
        button.addTarget(self, action: #selector(handleExitTrainButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    init(colorTheme: UIColor) {
        self.colorTheme = colorTheme
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
        configureDescriptionLabel()
        configureExitButton()
        configureContinueButton()
    }
    
    func configureSelf() {
        layer.cornerRadius = cornerRadius
    }
    
    func configureBackView() {
        backView.applyShadow(opacity: 0.2, radius: 15, offset: CGSize(width: 0, height: 0), color: .black)
        addSubview(backView)
        backView.fillSuperview()
    }
    
    func configureDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor,
                                paddingTop: 15, paddingLeft: 15, paddingRight: 15)
    }
    
    func configureExitButton() {
        addSubview(exitTrainButton)
        exitTrainButton.setHeight(height: 50)
        exitTrainButton.anchor(left: leftAnchor, right: rightAnchor, bottom: bottomAnchor,
                               paddingLeft: 16, paddingRight: 16)
    }
    
    func configureContinueButton() {
        addSubview(continueTrainButton)
        continueTrainButton.setHeight(height: 50)
        continueTrainButton.anchor(top: descriptionLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, bottom: exitTrainButton.topAnchor,
                                   paddingTop: 20, paddingLeft: 16, paddingRight: 16)
    }
    
    // MARK: - Selectors
    
    @objc func handleContinueTrainButtonPressed() {
        delegate?.continueTrain()
    }
    
    @objc func handleExitTrainButtonPressed() {
        delegate?.exitTrain()
    }
    
}
