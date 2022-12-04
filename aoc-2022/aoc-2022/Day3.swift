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
            
        case .two:
            var groups: [[String]] = []
            
            var count = 0
            var temp = [String]()
            
            Helper.read(filename: "day3.txt")
                .components(separatedBy: .newlines)
                .forEach {
                    if count == 3 {
                        groups.append(temp)
                        temp = []
                        count = 0
                    }
                    
                    temp.append($0)
                    count += 1
                }
            
            groups.append(temp)
            
            return groups.map {
                $0.map {
                    return Set($0)
                }
            }
            .map {
                $0.reduce($0.first!) {
                    $0.intersection($1)
                }
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
        }
    }
}
