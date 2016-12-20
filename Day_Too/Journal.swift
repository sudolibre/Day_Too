//
//  Entry.swift
//  Day_Too
//
//  Created by Jonathon Day on 12/20/16.
//  Copyright © 2016 dayj. All rights reserved.
//

import Foundation

class Journal: NSObject, NSCoding {
    var entries = [String]()
    
    override var description: String {
        var newDescription = "\nJournal Entries\n----------------------"
        if entries.count == 0 {
            newDescription += "\nNo entries have been entered!\n"
        } else {
        for i in entries.enumerated() {
            newDescription += ("\n\(i.offset + 1) - \(i.element)\n")
        }
        }
        return newDescription
    }

    func addNewEntry(_ entry: String) {
        entries.append(entry)
        print(NSKeyedArchiver.archiveRootObject(self, toFile: "/Users/noj/Code/TIY/Day_Too/journal.txt"))
    }
    
    init(entries: [String] = [String]()) {
        self.entries = entries
    }
    
    required convenience init?(coder decoder: NSCoder) {
        guard let decodedEntries = decoder.decodeObject(forKey: "entries") as? [String] else {
            return nil
        }
        self.init(entries: decodedEntries)
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(entries, forKey: "entries")

    }
}
