//
//  TipView.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import UIKit

protocol TipViewDelegate {
    func closeTipView()
}

class TipView: UIView {
    
    // MARK: - Properties
    
    // init
    private let sectionTrainType: SectionTrainType
    
    // delegate
    var delegate: TipViewDelegate?
    
    // ui
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
        label.textColor = .mainBlackColor
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.text = sectionTrainType.tipHeaderText
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = sectionTrainType.tipDescriptionText
        label.textColor = .mainBlackColor.withAlphaComponent(0.6)
        label.font = UIFont(name: Fonts.robotoRegular, size: 16)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = sectionTrainType.colorTheme
        button.setTitle("Вернуться в тренировку", for: .normal)
        button.layer.cornerRadius = 5
        button.tintColor = .mainWhiteColor
        button.titleLabel?.font = UIFont(name: Fonts.robotoRegular, size: 16)
        button.addTarget(self, action: #selector(handleCloseButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    init(sectionTrainType: SectionTrainType) {
        self.sectionTrainType = sectionTrainType
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
        configureDescriptionLabel()
    }
    
    func configureSelf() {
        layer.cornerRadius = cornerRadius
    }
    
    func configureBackView() {
        backView.applyShadow(opacity: 0.2, radius: 15, offset: CGSize(width: 0, height: 0), color: .black)
        addSubview(backView)
        backView.fillSuperview()
    }
    
    func configureHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.setHeight(height: 30)
        headerLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 16, paddingLeft: 15)
    }
    
    func configureCloseButton() {
        addSubview(closeButton)
        closeButton.setHeight(height: 50)
        closeButton.anchor(left: leftAnchor, right: rightAnchor, bottom: bottomAnchor,
                           paddingLeft: 16, paddingRight: 16, paddingBottom: 16)
    }
    
    func configureDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: headerLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, bottom: closeButton.topAnchor,
                                paddingTop: 15, paddingLeft: 15, paddingRight: 15, paddingBottom: 30)
    }
    
    // MARK: - Selectors
    
    @objc func handleCloseButtonPressed() {
        delegate?.closeTipView()
    }
    
}
