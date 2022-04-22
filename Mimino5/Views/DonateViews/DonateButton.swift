//
//  DonateButton.swift
//  Mimino6
//
//  Created by Vladislav on 05.11.2021.
//

import UIKit

class DonateButton: UIButton {
    
    // MARK: - Properties
    
    private let contentStackView = UIStackView()
    
    private let dollarImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "dollar"))
        image.setDimensions(height: 30, width: 30)
        return image
    }()
    
    private let donateAmountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainWhiteColor
        return label
    }()
    
    // MARK: - Lifecycle
    
    init(donateAmount: String) {
        donateAmountLabel.text = donateAmount
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        configureSelf()
        configureContentStackView()
    }
    
    func configureSelf() {
        setHeight(height: 50)
        backgroundColor = .georgianColor.withAlphaComponent(0.9)
        layer.cornerRadius = 15
    }
    
    func configureContentStackView() {
        contentStackView.addArrangedSubview(dollarImage)
        contentStackView.addArrangedSubview(donateAmountLabel)
        contentStackView.axis = .horizontal
        contentStackView.spacing = 10
        contentStackView.isUserInteractionEnabled = false
        contentStackView.alignment = .fill
        
        addSubview(contentStackView)
        contentStackView.centerInSuperview()
    }
    
}
