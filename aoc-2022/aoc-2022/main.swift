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
print(calorieSums.last ?? -1)

// part 2
print(calorieSums[(calorieSums.count - 3)...].reduce(0, +))


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

