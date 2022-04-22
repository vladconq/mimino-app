//
//  TopicSelectionButton.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import UIKit

class TopicSelectionButton: UIButton {
    
    // MARK: - Properties
    
    // init
    private let viewModel: TopicSelectionButtonViewModel
    
    // ui
    private lazy var symbolImage: UIImageView = {
        let imageView = UIImageView(image: viewModel.activeTopicIcon)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var topicLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.activeTopicName
        label.textColor = .mainBlackColor
        label.font = UIFont(name: Fonts.robotoRegular, size: 16)
        return label
    }()
    
    private let upSymbolImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.up")!)
        imageView.tintColor = .mainBlackColor
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    init(viewModel: TopicSelectionButtonViewModel) {
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
        configureSymbolImage()
        configureTopicLabel()
        configureDownSymbolImage()
    }
    
    func configureSelf() {
        backgroundColor = .mainBlackColor.withAlphaComponent(0.05)
        applyShadow(opacity: 0.1, radius: 10, offset: CGSize(width: 0, height: 0), color: .black)
        layer.cornerRadius = 20
        setHeight(height: 40)
    }
    
    func configureSymbolImage() {
        addSubview(symbolImage)
        symbolImage.setWidth(width: 40)
        symbolImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor)
    }
    
    func configureTopicLabel() {
        addSubview(topicLabel)
        topicLabel.anchor(left: symbolImage.rightAnchor, paddingLeft: 15)
        topicLabel.centerY(inView: self)
    }
    
    func configureDownSymbolImage() {
        addSubview(upSymbolImage)
        upSymbolImage.anchor(right: rightAnchor, paddingRight: 15)
        upSymbolImage.centerY(inView: self)
    }
    
    // MARK: - Helpers
    
    func redrawView() {
        symbolImage.alpha = 0.5
        topicLabel.alpha = 0.5
        symbolImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        
        symbolImage.image = viewModel.activeTopicIcon
        topicLabel.text = viewModel.activeTopicName
        
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.symbolImage.transform = .identity
        }
        
        UIView.animate(withDuration: 1) {
            self.symbolImage.alpha = 1
            self.topicLabel.alpha = 1
        }
    }
    
}
