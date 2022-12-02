//
//  main.swift
//  aoc-2022
//
//  Created by John Peden on 12/1/22.
//

import Foundation

// MARK: - Day 1
func processData() -> [Int] {
    read(filename: "day1.txt")
        .components(separatedBy: .newlines)
        .split(separator: "")
        .map {
            $0.compactMap { Int($0) }
                .reduce(0, +)
        }
        .sorted()
}

let calorieSums = processData()

// part 1
print("Day 1:")
print(calorieSums.last ?? -1)

// part 2
print(calorieSums[(calorieSums.count - 3)...].reduce(0, +))
print("---------------------------------------")


// MARK: - Day 2
let scoreGuide = [
    "R": 1,
    "P": 2,
    "S": 3,
]

let encryptGuide = [
    "X": "R",
    "Y": "P",
    "Z": "S",
    "A": "R",
    "B": "P",
    "C": "S"
]

func play(them: String, you: String) -> Int {
    // if you tie
    if them == you {
        return 3
    }
    
    // rock/scissor combo to handle wrapping
    if them == "R" && you == "S" {
        return 0
    }
    
    if them == "S" && you == "R" {
        return 6
    }
    
    //otherwise, use score guide to compare
    // also force unwrap because this is aoc, not prod
    if scoreGuide[you]! > scoreGuide [them]! {
        return 6
    }
    
    // all other options, you lost
    return 0
}

func process() -> Int {
    read(filename: "day2.txt")
        .components(separatedBy: .newlines)
        .map {
            $0.components(separatedBy: .whitespaces)
                .map {
                    encryptGuide[$0]!
                }
        }
        .map {
            play(them: $0[0], you: $0[1]) + scoreGuide[$0[1]]!
        }
        .reduce(0, +)
        
}

print("Day 2:")
print(process())



// MARK: - Helpers
func read(filename: String) -> String {
    if let directory = FileManager.default.urls(
        for: .desktopDirectory,
        in: .userDomainMask
    ).first {
        
        let filePath = directory.appending(component: "aoc/\(filename)")
        
        do {
            return try String(contentsOf: filePath)
        } catch (let err) {
            print(err)
        }
    }
    
    return ""
}

