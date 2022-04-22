//
//  LetterCellViewModel.swift
//  Mimino5
//
//  Created by Vladislav on 19.10.2021.
//

import UIKit

class LetterCellViewModel {
    
    // MARK: - Properties
    
    // init
    private let letter: Letter
    
    // ui
    
    var letterPronounciationAudioPath: String {
        letter.pronunciationAudioPath
    }
    
    var letterLabelAttributedText: NSAttributedString {
        let attributedText = NSMutableAttributedString(string: letter.origin,
                                                       attributes: [
                                                        .font: UIFont(name: Fonts.robotoRegular, size: 40)!,
                                                        .foregroundColor: UIColor.mainBlackColor.withAlphaComponent(0.85)
                                                       ])
        attributedText.append(NSAttributedString(string: "  \(letter.transliteration)",
                                                 attributes: [
                                                    .font: UIFont(name: Fonts.robotoRegular, size: 20)!,
                                                    .foregroundColor: UIColor.mainBlackColor.withAlphaComponent(0.5)
                                                 ]))
        return attributedText
    }
    
    var letterClarificationText: String {
        letter.clarification
    }

    // MARK: - Lifecycle
    
    init(letter: Letter) {
        self.letter = letter
    }
    
}
