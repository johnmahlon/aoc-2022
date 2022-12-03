//
//  main.swift
//  aoc-2022
//
//  Created by John Peden on 12/1/22.
//

import Foundation

enum Part {
    case one
    case two
}

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
enum Choice: Int {
    case rock = 1
    case paper = 2
    case scissors = 3
}

enum GameResult: Int {
    case win = 6
    case loss = 0
    case tie = 3
}

let encryptGuidePart1: [String: Choice] = [
    "X": .rock,
    "Y": .paper,
    "Z": .scissors,
    "A": .rock,
    "B": .paper,
    "C": .scissors
]

func play(them: Choice, you: Choice) -> GameResult {
    // if you tie
    if them == you {
        return .tie
    }
    
    // rock/scissor combo to handle wrapping
    if them == .rock && you == .scissors {
        return .loss
    }
    
    if them == .scissors && you == .rock {
        return .win
    }
    
    //otherwise, use score guide to compare
    // also force unwrap because this is aoc, not prod
    if you.rawValue > them.rawValue {
        return .win
    }
    
    // all other options, you lost
    return .loss
}

func process(part: Part) -> Int {
    switch part {
    case .one: return read(filename: "day2.txt")
            .components(separatedBy: .newlines)
            .map {
                $0.components(separatedBy: .whitespaces)
                    .map {
                        encryptGuidePart1[$0]!
                    }
            }
            .map {
                play(them: $0[0], you: $0[1]).rawValue + $0[1].rawValue
            }
            .reduce(0, +)
 
        
    case .two: return 0
        
    }
}

print("Day 2:")
print(process(part: .one))


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

