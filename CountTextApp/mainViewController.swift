//
//  ViewController.swift
//  CountTextApp
//
//  Created by Vasichko Anna on 12.04.2022.
//

import UIKit

// Storyboard и IBOutlets будут готовы изначально до записи, чтобы не тратить время

// Сначала объяснить отдельно про метод enumerateStrings и параметры в замыкании substring, substringRange, enslosingRange, stop и также реализовать вывод в print конкретного количества слов при помощи stop:

//var wordCount = 0
//let text = mainTextView.text
//text.enumerateSubstrings(in: text?.startIndex..< text.endIndex, options: .byWords) { substring, substringRange, enclosingRange, stop in
//    print(text[substringRange])
//    wordCount += 1
//    if wordCount == 10 {
//        stop = true
//    }
//}

class mainViewController: UIViewController {
    @IBOutlet weak var mainTextView: UITextView!
    
    @IBOutlet weak var charactersCountLabel: UILabel!
    
    @IBOutlet weak var wordsCountLabel: UILabel!
    
    @IBOutlet weak var paragraphsCountLabel: UILabel!
    
    @IBOutlet weak var linesCountLabel: UILabel!
    
    private var totalCharacters: Int {
        mainTextView.text.count
    }
    
    // Метод в кнопке реализовать при записи видео
    @IBAction func countButtonPressed() {
        charactersCountLabel.text = "Total characters: \(totalCharacters) Characters"
        wordsCountLabel.text = "Total words: \(countTextComponents(options: .byWords)) Words"
        paragraphsCountLabel.text = "Total paragraphs: \(countTextComponents(options: .byParagraphs)) Paragraphs"
        linesCountLabel.text = "Total lines: \(countTextComponents(options: .byLines)) Lines"
        
    }
    
    @IBAction func cleanButtonPressed() {
        mainTextView.text = ""
    }
    
    //Приватный метод реализовать при записи видео
    private func countTextComponents(options: String.EnumerationOptions) -> Int {
        var components = [Substring]()
        guard let text = mainTextView.text else { return 0 }
        text.enumerateSubstrings(in: text.startIndex..<text.endIndex, options: options) { _, substringRange, _, _ in
            components.append(text[substringRange])
        }
        return components.count
    }
}


