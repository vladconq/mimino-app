//
//  LetterTableCell.swift
//  Mimino5
//
//  Created by Vladislav on 19.10.2021.
//

import UIKit
import AVFoundation

class LetterTableCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let reuseIdentifier = "LetterTableCell"
    
    // viewModels
    var viewModel: LetterCellViewModel? {
        didSet {
            letterLabel.attributedText = viewModel!.letterLabelAttributedText
            clarificationLabel.text = viewModel!.letterClarificationText
        }
    }
    
    // ui
    private var audioPlayer: AVAudioPlayer?
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainWhiteColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let letterLabel = UILabel()
    private let clarificationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .mainBlackColor.withAlphaComponent(0.5)
        label.numberOfLines = 2
        return label
    }()
    private let audioButton = AudioButton(color: .letterAlphabetColor)
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = .mainWhiteColor
    }
    
    // MARK: - UI
    
    func configureUI() {
        configureBackView()
        configureLetterLabel()
        configureAudioButton()
        configureClarificationLabel()
    }
    
    func configureBackView() {
        contentView.addSubview(backView)
        backView.fillSuperview(padding: UIEdgeInsets(top: 6, left: 20, bottom: 6, right: 20))
    }
    
    func configureLetterLabel() {
        contentView.addSubview(letterLabel)
        letterLabel.anchor(top: backView.topAnchor, left: backView.leftAnchor, paddingLeft: 20)
    }
    
    func configureAudioButton() {
        contentView.addSubview(audioButton)
        audioButton.setDimensions(height: 30, width: 30)
        audioButton.anchor(right: backView.rightAnchor, paddingRight: 20)
        audioButton.centerY(inView: backView)
        
        audioButton.addTarget(self, action: #selector(handleAudioButtonPressed), for: .touchUpInside)
    }
    
    func configureClarificationLabel() {
        contentView.addSubview(clarificationLabel)
        clarificationLabel.anchor(top: letterLabel.bottomAnchor, left: backView.leftAnchor, right: audioButton.leftAnchor,
                                  bottom: backView.bottomAnchor, paddingLeft: 20)
    }
    
    // MARK: - Selectors
    
    @objc func handleAudioButtonPressed() {
        let data = NSDataAsset(name: viewModel!.letterPronounciationAudioPath)!
        
        do {
            audioPlayer = try AVAudioPlayer(data: data.data)
            audioPlayer?.play()
        } catch {
            return
        }
    }
    
}
