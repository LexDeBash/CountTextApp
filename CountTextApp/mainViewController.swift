//
//  ViewController.swift
//  CountTextApp
//
//  Created by Vasichko Anna on 12.04.2022.
//

import UIKit

class mainViewController: UIViewController {
    @IBOutlet weak var mainTextView: UITextView!
    
    @IBOutlet weak var charactersCountLabel: UILabel!
    
    @IBOutlet weak var wordsCountLabel: UILabel!
    
    @IBOutlet weak var paragraphsCountLabel: UILabel!
    
    @IBOutlet weak var linesCountLabel: UILabel!
    
    private var totalCharacters: Int {
        mainTextView.text.count
    }
    
    
    @IBAction func countButtonPressed() {
        charactersCountLabel.text = "Total characters: \(totalCharacters) Characters"
        wordsCountLabel.text = "Total words: \(countTextComponents(options: .byWords)) Words"
        paragraphsCountLabel.text = "Total paragraphs: \(countTextComponents(options: .byParagraphs)) Paragraphs"
        linesCountLabel.text = "Total lines: \(countTextComponents(options: .byLines)) Lines"
        
    }
    
    @IBAction func cleanButtonPressed() {
        mainTextView.text = ""
    }
    
    private func countTextComponents(options: String.EnumerationOptions) -> Int {
        var components = [Substring]()
        guard let text = mainTextView.text else { return 0 }
        text.enumerateSubstrings(in: text.startIndex..<text.endIndex, options: options) { _, substringRange, _, _ in
            components.append(text[substringRange])
        }
        return components.count
    }
}

