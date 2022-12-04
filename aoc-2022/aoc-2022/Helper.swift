//
//  Helper.swift
//  aoc-2022
//
//  Created by John Peden on 12/3/22.
//

import Foundation

struct Helper {
    static func read(filename: String) -> String {
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
}



