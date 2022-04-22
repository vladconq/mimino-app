//
//  TopPanelView.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import UIKit

protocol TopPanelViewDelegate {
    func handleDismissButtonPressed()
    func handleInfoButtonPressed()
}

class TopPanelView: UIView {
    
    // MARK: - Properties
    
    // init
    let viewModel: TopPanelViewModel
    
    // delegate
    var delegate: TopPanelViewDelegate?
    
    // ui
    let stackView = UIStackView()
    
    private let dismissButton: UIButton = {
        let button = UIButton()
        button.tintColor = .mainWhiteColor
        button.setImage(UIImage(systemName: "multiply", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), for: .normal)
        button.addTarget(self, action: #selector(handleDismissButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var progressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = viewModel.progressText
        label.tintColor = .mainWhiteColor
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private let infoButton: UIButton = {
        let button = UIButton()
        button.tintColor = .mainWhiteColor
        button.setImage(UIImage(systemName: "info.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20)), for: .normal)
        button.addTarget(self, action: #selector(handleInfoButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.trackTintColor = .mainWhiteColor
        progressView.progressTintColor = .progressColor
        progressView.layer.cornerRadius = 2
        progressView.clipsToBounds = true
        return progressView
    }()
    
    // MARK: - Lifecycle
    
    init(viewModel: TopPanelViewModel) {
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
        configureStack()
        configureProgressView()
    }
    
    func configureSelf() {
        viewModel.delegate = self
        heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    func configureStack() {
        [dismissButton, progressLabel, infoButton].forEach {
            view in stackView.addArrangedSubview(view)
        }
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        addSubview(stackView)
        stackView.anchor(left: leftAnchor, right: rightAnchor)
    }
    
    func configureProgressView() {
        addSubview(progressView)
        progressView.anchor(top: stackView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 20)
    }
    
    // MARK: - Selectors
    
    @objc func handleDismissButtonPressed() {
        delegate?.handleDismissButtonPressed()
    }
    
    @objc func handleInfoButtonPressed() {
        delegate?.handleInfoButtonPressed()
    }
    
}

extension TopPanelView: TopPanelViewModelDelegate {
    func updateTopPanelView() {
        progressLabel.text = viewModel.progressText
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseOut) {
            self.progressView.setProgress(self.viewModel.progressValue, animated: true)
        }
    }
}
