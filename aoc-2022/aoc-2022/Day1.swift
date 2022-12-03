//
//  Day1.swift
//  aoc-2022
//
//  Created by John Peden on 12/3/22.
//

import Foundation

struct Day1 {
    static func processData() -> [Int] {
        Helper.read(filename: "day1.txt")
            .components(separatedBy: .newlines)
            .split(separator: "")
            .map {
                $0.compactMap { Int($0) }
                    .reduce(0, +)
            }
            .sorted()
    }
}
