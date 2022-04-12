//
//  ViewController.swift
//  CountTextApp
//
//  Created by Vasichko Anna on 12.04.2022.
//

import UIKit

// Storyboard и IBOutlets будут готовы изначально до записи, чтобы не тратить время

// Сначала объяснить отдельно про метод enumerateStrings и параметры в замыкании substring, substringRange, enslosingRange, stop и также реализовать вывод в print конкретного количества слов при помощи stop:

/*
var wordCount = 0
let text = mainTextView.text
text.enumerateSubstrings(in: text?.startIndex..< text.endIndex, options: .byWords) { substring, substringRange, enclosingRange, stop in
    print(text[substringRange])
    wordCount += 1
    if wordCount == 10 {
        stop = true
    }
 
 Тут в коде не используются свойства substring и enslosingRange.
}
*/

// Почему название класса и название файла было с маленькой буквы?
class MainViewController: UIViewController {
    @IBOutlet var textOptionsLabel: UILabel! {
        didSet {
            textOptionsLabel.text = text.textOptions
        }
    }
    @IBOutlet weak var mainTextView: UITextView! {
        didSet {
            text.text = mainTextView.text ?? ""
        }
    }
    
    private var text = Text()
    
    // Метод в кнопке реализовать при записи видео
    @IBAction func countButtonPressed() {
        let text = Text(text: mainTextView.text ?? "")
        textOptionsLabel.text = text.textOptions
    }
    
    @IBAction func cleanButtonPressed() {
        mainTextView.text = ""
    }
}

// Модель следует вынести в отдельный файл
struct Text {
    var text = ""
    
    var textOptions: String {
        """
        Total characters: \(totalCharacters) Characters
        Total words: \(countTextComponents(options: .byWords)) Words
        Total paragraphs: \(countTextComponents(options: .byParagraphs)) Paragraphs
        Total lines: \(countTextComponents(options: .byLines)) Lines
        """
    }
    
    private var totalCharacters: Int {
        text.count
    }
    
    private func countTextComponents(options: String.EnumerationOptions) -> Int {
        var components = [Substring]()
        text.enumerateSubstrings(in: text.startIndex..<text.endIndex, options: options) { _, substringRange, _, _ in
            components.append(text[substringRange])
        }
        return components.count
    }
}
