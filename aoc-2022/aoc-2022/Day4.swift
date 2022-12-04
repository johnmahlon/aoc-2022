//
//  Day4.swift
//  aoc-2022
//
//  Created by John Peden on 12/4/22.
//

import Foundation

struct Day4 {
    static func process() -> Int {
        Helper.read(filename: "day4.txt")
            .components(separatedBy: .newlines)
            .map {
                $0.components(separatedBy: ",")
                    .map { $0.components(separatedBy: "-") }
            }
            .compactMap {
                let firstSet = $0[0].map { Int($0)! }
                let secondSet = $0[1].map { Int($0)! }
                
                return firstSet[0] >= secondSet[0] && firstSet[1] <= secondSet[1]
                        || secondSet[0] >= firstSet[0] && secondSet[1] <= firstSet[1]
            }
            .filter { $0 }
            .count
    }
}


