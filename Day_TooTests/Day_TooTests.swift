//
//  Day_TooTests.swift
//  Day_TooTests
//
//  Created by Jonathon Day on 12/20/16.
//  Copyright © 2016 dayj. All rights reserved.
//

import XCTest
@testable import Day_Too

class Day_TooTests: XCTestCase {
    
    func testViewJournal() {
        let journal = Journal(entries: ["Once upon a time", "I went to the store", "It was dope"])
        let expected = "\nJournal Entries\n----------------------\n1 - Once upon a time\n\n2 - I went to the store\n\n3 - It was dope\n"
        let actual =  journal.description
        XCTAssertTrue(expected == actual)
    }
    
    func testAddEntry() {
        let journal = Journal(entries: ["Once upon a time", "I went to the store", "It was dope"])
        journal.addNewEntry("testME!")
        let expected = "testME!"
        let result = journal.entries[3]
        XCTAssertTrue(expected == result)
    }
    
    func testNSCoderRoundTrip() {
        let journal = Journal(entries: ["Once upon a time", "I went to the store", "It was dope"])
        let testNumber = arc4random_uniform(UInt32.max)
        let expected = String(testNumber)
        journal.addNewEntry(expected)
        let newJournal = NSKeyedUnarchiver.unarchiveObject(withFile: "/Users/noj/Code/TIY/Day_Too/journal.txt") as? Journal
        XCTAssertTrue(newJournal!.entries.contains(expected))
    }

}
