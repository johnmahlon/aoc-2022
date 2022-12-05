//
//  Day4.swift
//  aoc-2022
//
//  Created by John Peden on 12/4/22.
//

import Foundation

struct Day4 {
    static func process(part: Part) -> Int {
        Helper.read(filename: "day4.txt")
            .components(separatedBy: .newlines)
            .map {
                $0.components(separatedBy: ",")
                    .map {
                        $0.components(separatedBy: "-")
                            .map { Int($0)! }
                    }
            }
            .filter { (s: [[Int]]) in
                Day4.overlaps(part: part, s)
            }
            .count
    }
    
    static func overlaps(part: Part, _ s: [[Int]]) -> Bool {
        switch part {
        case .one: return s[0][0] >= s[1][0] && s[0][1] <= s[1][1] || s[1][0] >= s[0][0] && s[1][1] <= s[0][1]
        case .two: return s[0][1] >= s[1][0] && s[1][1] >= s[0][0]
        }
    }
}






