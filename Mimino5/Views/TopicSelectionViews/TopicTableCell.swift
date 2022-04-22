//
//  TopicTableCell.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import UIKit

class TopicTableCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let reuseIdentifier = "TopicTableCell"
    
    // init
    var viewModel: TopicCellViewModel? {
        didSet {
            topicNameLabel.text = viewModel?.topicName
            topicIcon.image = viewModel?.topicIcon
            topicProgress.setProgress(viewModel?.topicProgress ?? 0, animated: true)
        }
    }
    
    // ui
    
    private let topicIcon: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let topicNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainBlackColor
        label.font = UIFont(name: Fonts.robotoRegular, size: 16)
        return label
    }()
    
    private let topicProgress: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.trackTintColor = .systemGray.withAlphaComponent(0.15)
        progressView.progressTintColor = .letterQuizColor.withAlphaComponent(0.9)
        progressView.layer.cornerRadius = 5
        progressView.clipsToBounds = true
        progressView.transform = CGAffineTransform(rotationAngle: -.pi / 2)
        return progressView
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = .clear
    }
    
    // MARK: - UI
    
    func configureUI() {
        configureSelf()
        configureTopicIcon()
        configureTopicNameLabel()
        configureTopicProgress()
    }
    
    func configureSelf() {
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    func configureTopicIcon() {
        addSubview(topicIcon)
        topicIcon.setDimensions(height: 40, width: 40)
        topicIcon.anchor(left: leftAnchor, paddingLeft: 25)
        topicIcon.centerY(inView: self)
    }
    
    func configureTopicNameLabel() {
        addSubview(topicNameLabel)
        topicNameLabel.anchor(left: topicIcon.rightAnchor, paddingLeft: 15)
        topicNameLabel.centerY(inView: self)
    }
    
    func configureTopicProgress() {
        addSubview(topicProgress)
        topicProgress.anchor(right: rightAnchor, paddingRight: 25)
        topicProgress.setDimensions(height: 10, width: 35)
        topicProgress.centerY(inView: self)
    }
    
}
