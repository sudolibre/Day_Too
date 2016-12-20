
//
//  Main.swift
//  Day_Too
//
//  Created by Jonathon Day on 12/20/16.
//  Copyright © 2016 dayj. All rights reserved.
//

import Foundation

func mainLoop() {
    let journal = loadOrCreateJournal()
    playLoop(withJournal: journal)
}

func loadOrCreateJournal() -> Journal {
    var journal = NSKeyedUnarchiver.unarchiveObject(withFile: "/Users/noj/Code/TIY/Day_Too/journal.txt") as? Journal
    if journal == nil {
        journal = Journal()
    }
    return journal!
}

func playLoop(withJournal: Journal) {
    let journal = withJournal
    var userUsingApp = true
    
    while userUsingApp == true {
        let answer = answerToQuestion("\nWhat would you like to do next", withPossibleAnswers: ["Add new journal entry", "View Journal Entry", "Quit"])
        switch answer {
        case 0:
            let entry = getEntry()
            journal.addNewEntry(entry)
        case 1:
            print(journal)
        case 2:
            userUsingApp = false
        default:
            fatalError()
        }
    }
}

func getEntry() -> String {
    var answer: String?
    
    while answer == nil {
        print("Type your new journal entry and press enter:")
        if let entry = readLine(strippingNewline: true) {
            answer = entry
        } else {
            print("We didn't get that. Please try again")
        }
    }
    return answer!
}


func answerToQuestion(_ question: String, withPossibleAnswers possibleAnswers: [String]) -> Int {
    print(question)
    var intAnswer: Int?
    let selection = possibleAnswers.enumerated()
    for i in selection {
        print("\(i.offset) - \(i.element)")
    }
    
    while intAnswer == nil {
        var answer: String?
        while answer == nil {
        answer = readLine(strippingNewline: true)
        }

        if let answer = Int(answer!) {
            if answer < possibleAnswers.count {
                intAnswer = answer
            } else {
                print("invalid selection. Please select a number between 0 and \(possibleAnswers.count - 1)")
            }
        } else {
            print("invalid selection. Please select a number between 0 and \(possibleAnswers.count - 1)")
        }
    }
    return intAnswer!
}
