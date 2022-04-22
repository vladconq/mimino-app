//
//  MenuButton.swift
//  Mimino5
//
//  Created by Vladislav on 17.10.2021.
//

import UIKit

class MenuButton: UIButton {
    
    // MARK: - Properties
    
    // init
    private let viewModel: MenuButtonViewModel
    
    // intraclass variables
    private let gradient = CAGradientLayer()
    private let cornerRadius: CGFloat = 20
    private lazy var colorTheme = viewModel.colorTheme
    private lazy var menuButtonHeight = viewModel.menuButtonHeight
    
    // ui
    
    private lazy var trainNameLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.trainName
        label.textColor = .mainWhiteColor
        label.font = UIFont(name: Fonts.robotoBold, size: 20)
        return label
    }()
    
    private lazy var trainDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.trainDescription
        label.textColor = .mainWhiteColor
        label.numberOfLines = 2
        label.font = UIFont(name: Fonts.robotoRegular, size: 14)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var highScoreLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.highScoreText
        label.textColor = .mainWhiteColor.withAlphaComponent(0.6)
        label.font = UIFont(name: Fonts.robotoRegular, size: 12)
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var decorativeCircles: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = cornerRadius
        view.isUserInteractionEnabled = false
        
        let outerCircle: UIView = {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
            view.backgroundColor = .white
            view.alpha = 0.04
            view.layer.cornerRadius = view.frame.size.width / 2
            view.center = viewModel.circleCenterPoint
            return view
        }()
        
        let innerCircle: UIView = {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            view.backgroundColor = .white
            view.alpha = 0.04
            view.layer.cornerRadius = view.frame.size.width / 2
            view.center = outerCircle.center
            view.center.x += 20
            view.center.y += 25
            return view
        }()
        
        view.addSubview(outerCircle)
        view.addSubview(innerCircle)
        return view
    }()
    
    // MARK: - LifeCycle
    
    init(viewModel: MenuButtonViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        configureUI()
    }
    
    override func layoutSubviews() {
        gradient.frame = self.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    func configureUI() {
        configureSelf()
        configureGradientLayer()
        configureDecorativeCircles()
        configureTrainNameLabel()
        configureTrainDescriptionLabel()
        configureHighScoreLabel()
    }
    
    func configureSelf() {
        setHeight(height: menuButtonHeight)        
        applyShadow(opacity: 0.2, radius: 10, offset: CGSize(width: 0, height: 5), color: .black)
        layer.cornerRadius = cornerRadius
    }
    
    func configureGradientLayer() {
        backgroundColor = .white
        gradient.cornerRadius = cornerRadius
        gradient.colors = [colorTheme.cgColor, colorTheme.withAlphaComponent(0.8).cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func configureDecorativeCircles() {
        addSubview(decorativeCircles)
        decorativeCircles.fillSuperview()
    }
    
    func configureTrainNameLabel() {
        addSubview(trainNameLabel)
        trainNameLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 20, paddingLeft: 15)
    }
    
    func configureTrainDescriptionLabel() {
        addSubview(trainDescriptionLabel)
        trainDescriptionLabel.anchor(top: trainNameLabel.bottomAnchor, left: leftAnchor,
                                     paddingTop: 10, paddingLeft: 15)
        trainDescriptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
    }
    
    func configureHighScoreLabel() {
        addSubview(highScoreLabel)
        highScoreLabel.anchor(left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, paddingLeft: 15, paddingRight: 15, paddingBottom: 15)
    }
    
    // MARK: Helpers
    
    func redrawView() {
        highScoreLabel.alpha = 0
        highScoreLabel.text = viewModel.highScoreText
        UIView.animate(withDuration: 1) {
            self.highScoreLabel.alpha = 1
        }
    }
    
}
