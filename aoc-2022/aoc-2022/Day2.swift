//
//  Day2.swift
//  aoc-2022
//
//  Created by John Peden on 12/3/22.
//

import Foundation

struct Day2 {
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

    static let encryptGuide: [String: Choice] = [
        "X": .rock,
        "Y": .paper,
        "Z": .scissors,
        "A": .rock,
        "B": .paper,
        "C": .scissors
    ]

    static let encryptResultGuide: [String: GameResult] = [
        "X": .loss,
        "Y": .tie,
        "Z": .win
    ]

    static func play(them: Choice, you: Choice) -> GameResult {
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

    static func play(them: Choice, result: GameResult) -> Choice {
        switch result {
        case .win:
            if them == .scissors {
                return .rock
            } else if them == .rock {
                return .paper
            } else {
                return .scissors
            }
            
        case .tie: return them
            
        case .loss:
            if them == .scissors {
                return .paper
            } else if them == .rock {
                return .scissors
            } else {
                return .rock
            }
        }
        
    }

    static func process(part: Part) -> Int {
        switch part {
        case .one: return Helper.read(filename: "day2.txt")
                .components(separatedBy: .newlines)
                .map {
                    $0.components(separatedBy: .whitespaces)
                        .map {
                            encryptGuide[$0]!
                        }
                }
                .map {
                    play(them: $0[0], you: $0[1]).rawValue + $0[1].rawValue
                }
                .reduce(0, +)
     
            
        case .two: return Helper.read(filename: "day2.txt")
                .components(separatedBy: .newlines)
                .map {
                    $0.components(separatedBy: .whitespaces)
                }
                .map {
                    (encryptGuide[$0[0]]!, encryptResultGuide[$0[1]]!)
                }
                .map {
                    play(them: $0.0, result: $0.1).rawValue + $0.1.rawValue
                }
                .reduce(0, +)
        }
    }
}
