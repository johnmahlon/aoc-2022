//
//  Day3.swift
//  aoc-2022
//
//  Created by John Peden on 12/3/22.
//

import Foundation

struct Day3 {
    struct Rucksack {
        let compartment1: Set<Character>
        let compartment2: Set<Character>
    }
    
    static let lowerOffsetFromAscii = 96
    static let upperOffsetFromAscii = 38
    
    static func process(part: Part) -> Int {
        
        switch part {
        case .one: return Helper.read(filename: "day3.txt")
                .components(separatedBy: .newlines)
                .map {
                    Array($0)
                }
                .map {
                    let midpoint = $0.count / 2
                    let firstHalf = Set($0[0..<midpoint])
                    let secondHalf = Set($0[midpoint...])
                    return Rucksack(compartment1: firstHalf, compartment2: secondHalf)
                }
                .map { (sack: Rucksack) in
                    sack.compartment1.intersection(sack.compartment2)
                }
                .flatMap { $0 }
                .map {
                    if $0.isUppercase {
                        return Int($0.asciiValue! - 38)
                    } else {
                        return Int($0.asciiValue! - 96)
                    }
                }
                .reduce(0, +)
            
        case .two: Helper.read(filename: "day3_test.txt")
                .components(separatedBy: .newlines)
                .forEach { print($0) }
            return 0
        }
    }
}
