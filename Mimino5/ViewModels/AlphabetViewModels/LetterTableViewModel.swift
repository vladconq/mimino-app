//
//  LetterTableViewModel.swift
//  Mimino5
//
//  Created by Vladislav on 19.10.2021.
//

import Foundation

class LetterTableViewModel {
    
    // MARK: - Properties
    
    // init
    private let letters: [Letter]
    
    // MARK: - Lifecycle
    
    init(letters: [Letter]) {
        self.letters = letters
    }
    
    // MARK: - Helpers
    
    func getCellViewModel(index: Int) -> LetterCellViewModel {
        return LetterCellViewModel(letter: letters[index])
    }
    
    func getLettersCount() -> Int {
        return letters.count
    }
    
}
