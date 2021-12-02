//
//  main.swift
//  ProblemSolving
//
//  Created by Eido Goya on 2021/09/19.
//

import Foundation

solution()


func solution() {
    let now = "TUE 10:00"
    
    let nComps = now.split(separator: " ")
    let nWeek = nComps.first.map{"\($)"}.joined()
    let trimmedString = string.trimmingCharacters(in: .whitespaces)
    print(comvertWeekStrToInt(nWeek))
}

func comvertWeekStrToInt(_ w: String) -> Int {
    let map: [String: Int] = [
        "TUE": 3
    ]
    let key = w.uppercased()
    if let num = map[key] {
        return num
    }
    return 999
}
