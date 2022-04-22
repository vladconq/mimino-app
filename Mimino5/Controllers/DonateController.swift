//
//  DonateController.swift
//  Mimino6
//
//  Created by Vladislav on 05.11.2021.
//

import UIKit

class DonateController: UIViewController {
    
    // MARK: - Properties
    
    private let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainWhiteColor
        view.layer.cornerRadius = 10
        view.applyShadow(opacity: 0.1, radius: 10, offset: CGSize(width: 0, height: 0), color: .mainBlackColor)
        return view
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Поддержка"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .mainBlackColor.withAlphaComponent(0.85)
        return label
    }()
    
    private let descriptiveLabel: UILabel = {
        let label = UILabel()
        label.text = "Я стараюсь делать свое приложение полезным и удобным для всех, кто желает выучить грузинский язык. Благодаря вашей обратной связи Mimino будет становиться еще лучше. Поддержать меня вы можете донатом или отзывом в App Store. Спасибо!"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .mainBlackColor.withAlphaComponent(0.7)
        return label
    }()
    
    private let upperDonateButtonsStack = UIStackView()
    private let lowerDonateButtonsStack = UIStackView()
    private let donateButton1 = DonateButton(donateAmount: Product.donate_99.desription)
    private let donateButton2 = DonateButton(donateAmount: Product.donate_179.desription)
    private let donateButton3 = DonateButton(donateAmount: Product.donate_279.desription)
    private let donateButton4 = DonateButton(donateAmount: Product.donate_379.desription)
    
    private let line: UIView = {
        let view = UIView()
        view.setHeight(height: 1)
        view.backgroundColor = .mainBlackColor.withAlphaComponent(0.1)
        return view
    }()
    
    private let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let view = UIVisualEffectView(effect: blurEffect)
        return view
    }()
    
    private let dismissButton: UIButton = {
        let button = UIButton()
        button.setHeight(height: 50)
        button.setTitle("Вернуться на главную", for: .normal)
        button.backgroundColor = .georgianColor.withAlphaComponent(0.9)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(handleDismissButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureSelectors()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view != baseView {
            handleDismissButtonPressed()
        }
    }
    
    // MARK: - UI
    
    func configureUI() {
        configureSelf()
        configureBaseView()
        configureMainLabel()
        configureDescriptiveLabel()
        configureDonateButtons()
        configureLine()
        configureDismissButton()
    }
    
    func configureSelf() {
        view.backgroundColor = .clear
        view.addSubview(visualEffectView)
        visualEffectView.fillSuperview()
    }
    
    func configureBaseView() {
        view.addSubview(baseView)
        baseView.anchor(left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 30, paddingRight: 30)
        baseView.centerInSuperview()
    }
    
    func configureMainLabel() {
        baseView.addSubview(mainLabel)
        mainLabel.anchor(top: baseView.topAnchor, paddingTop: 15)
        mainLabel.centerX(inView: baseView)
    }
    
    func configureDescriptiveLabel() {
        baseView.addSubview(descriptiveLabel)
        descriptiveLabel.anchor(top: mainLabel.bottomAnchor, left: baseView.leftAnchor, right: baseView.rightAnchor,
                                paddingTop: 15, paddingLeft: 20, paddingRight: 20, paddingBottom: 15)
    }
    
    func configureDonateButtons() {
        upperDonateButtonsStack.addArrangedSubview(donateButton1)
        upperDonateButtonsStack.addArrangedSubview(donateButton2)
        upperDonateButtonsStack.axis = .horizontal
        upperDonateButtonsStack.distribution = .fillEqually
        upperDonateButtonsStack.spacing = 10
        baseView.addSubview(upperDonateButtonsStack)
        upperDonateButtonsStack.anchor(top: descriptiveLabel.bottomAnchor, left: baseView.leftAnchor, right: baseView.rightAnchor,
                                       paddingTop: 20, paddingLeft: 20, paddingRight: 20, paddingBottom: 15)
        
        lowerDonateButtonsStack.addArrangedSubview(donateButton3)
        lowerDonateButtonsStack.addArrangedSubview(donateButton4)
        lowerDonateButtonsStack.axis = .horizontal
        lowerDonateButtonsStack.distribution = .fillEqually
        lowerDonateButtonsStack.spacing = 10
        baseView.addSubview(lowerDonateButtonsStack)
        lowerDonateButtonsStack.anchor(top: upperDonateButtonsStack.bottomAnchor, left: baseView.leftAnchor, right: baseView.rightAnchor,
                                       paddingTop: 10, paddingLeft: 20, paddingRight: 20)
    }
    
    func configureLine() {
        baseView.addSubview(line)
        line.anchor(top: lowerDonateButtonsStack.bottomAnchor, left: baseView.leftAnchor, right: baseView.rightAnchor,
                    paddingTop: 10, paddingLeft: 40, paddingRight: 40)
    }
    
    func configureDismissButton() {
        baseView.addSubview(dismissButton)
        dismissButton.anchor(top: line.bottomAnchor, left: baseView.leftAnchor, right: baseView.rightAnchor, bottom: baseView.bottomAnchor,
                             paddingTop: 10, paddingLeft: 20, paddingRight: 20, paddingBottom: 15)
    }
    
    // MARK: - Selectors
    
    func configureSelectors() {
        donateButton1.addTarget(self, action: #selector(handleDonateButton1Pressed), for: .touchUpInside)
        donateButton2.addTarget(self, action: #selector(handleDonateButton2Pressed), for: .touchUpInside)
        donateButton3.addTarget(self, action: #selector(handleDonateButton3Pressed), for: .touchUpInside)
        donateButton4.addTarget(self, action: #selector(handleDonateButton4Pressed), for: .touchUpInside)
    }
    
    @objc func handleDonateButton1Pressed() {
        IAPManager.shared.purchase(product: .donate_99)
    }
    
    @objc func handleDonateButton2Pressed() {
        IAPManager.shared.purchase(product: .donate_179)
    }
    
    @objc func handleDonateButton3Pressed() {
        IAPManager.shared.purchase(product: .donate_279)
    }
    
    @objc func handleDonateButton4Pressed() {
        IAPManager.shared.purchase(product: .donate_379)
    }
    
    @objc func handleDismissButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
}
