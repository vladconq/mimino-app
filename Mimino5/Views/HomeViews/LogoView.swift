//
//  LogoView.swift
//  Mimino5
//
//  Created by Vladislav on 17.10.2021.
//

import UIKit

protocol LogoViewDelegate {
    func settingsButtonPressed()
    func donateButtonPressed()
}

class LogoView: UIView {
    
    // MARK: - Properties
    
    // delegate
    var delegate: LogoViewDelegate?
    
    // ui
    private let gradient = CAGradientLayer()
    private let cornerRadius: CGFloat = 20
    
    private let panelStack = UIStackView()
    
    private let donateButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "dollar"), for: .normal)
        
        button.imageView?.contentMode = .scaleAspectFit
        
        button.addTarget(self, action: #selector(handleDonateButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "MIMINO"
        label.textColor = .mainWhiteColor
        label.font = UIFont(name: Fonts.roundedExtraBold, size: 28)
        return label
    }()
    
    private let settingsButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "gearshape.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), for: .normal)
        button.tintColor = .mainWhiteColor
        button.addTarget(self, action: #selector(handleSettingsButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureDonateButtonAnimation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        gradient.frame = self.bounds
    }
    
    // MARK: - UI
    
    func configureUI() {
        configureSelf()
        configureGradientLayer()
        configurePanelStack()
    }
    
    func configureSelf() {
        layer.cornerRadius = cornerRadius
        applyShadow(opacity: 0.3, radius: 10, offset: CGSize(width: 0, height: 0), color: .black)
    }
    
    func configureGradientLayer() {
        backgroundColor = .white
        gradient.cornerRadius = cornerRadius
        gradient.colors = [UIColor.georgianColor.withAlphaComponent(0.8).cgColor, UIColor.georgianColor.cgColor]
        gradient.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        gradient.locations = [0.0, 1.0]
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func configurePanelStack() {
        for view in [donateButton, appNameLabel, settingsButton] {
            panelStack.addArrangedSubview(view)
        }
        
        panelStack.setHeight(height: 40)
        
        donateButton.setDimensions(height: 23, width: 23)
        
        panelStack.axis = .horizontal
        panelStack.distribution = .equalCentering
        addSubview(panelStack)
        panelStack.anchor(left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, paddingLeft: 25, paddingRight: 25, paddingBottom: 0)
    }
    
    // MARK: - Helpers
    
    func configureDonateButtonAnimation() {
        Timer.scheduledTimer(withTimeInterval: 6, repeats: true) {_ in
            UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseInOut, .allowUserInteraction]) {
                self.donateButton.transform = CGAffineTransform(translationX: 0, y: -8)
            } completion: { _ in
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.35, initialSpringVelocity: 0.6, options: [.curveEaseInOut,  .allowUserInteraction]) {
                    self.donateButton.transform = .identity
                }
            }
        }
    }
    
    // MARK: - Selectors
    
    @objc func handleSettingsButtonPressed() {
        delegate?.settingsButtonPressed()
    }
    
    
    @objc func handleDonateButtonPressed() {
        delegate?.donateButtonPressed()
    }
    
}
