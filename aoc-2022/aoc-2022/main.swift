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
let calorieSums = Day1.processData()
// part 1
print("Day 1:")
print(calorieSums.last ?? -1)

// part 2
print(calorieSums[(calorieSums.count - 3)...].reduce(0, +))
print("---------------------------------------")


// MARK: - Day 2
print("Day 2:")
print(Day2.process(part: .one))
print(Day2.process(part: .two))
print("---------------------------------------")

// MARK: - Day 3
print("Day 3:")
print(Day3.process(part: .one))
print(Day3.process(part: .two))
print("---------------------------------------")


// MARK: - Day 4
print("Day 4:")
print(Day4.process())
