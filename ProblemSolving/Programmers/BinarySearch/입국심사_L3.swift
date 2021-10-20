//
//  입국심사_L3.swift
//  ProblemSolving
//
//  Created by Eido Goya on 2021/09/26.
//

import Foundation

class 입국심사 {
//    print(solution(6, [7, 10])) // 28
//    print(solution(6, [4, 4, 2])) // 8
//    print(solution(3, [4, 4, 2])) // 4
//    print(solution(2, [5, 10, 2])) // 4

    func solutionBad(_ n:Int, _ times:[Int]) -> Int64 {
        
        var entries: [(Int64, Int64)] = [] // (time, accumulation)
        times.forEach {
            entries.append((Int64($0), 0))
        }
        
        var p = n
        var maxTime: Int64 = 0
        while p > 0 {
            var minEntry: (Int64, Int64, Int) = (0, 0, 0) // (time, accumulation, index)
            for (idx, entry) in entries.enumerated() {
                if minEntry.0 == 0 {
                    // init
                    minEntry = (entry.0, entry.1, idx)
                } else {
                    // compare
                    if minEntry.1+minEntry.0 < entry.0+entry.1 {
                        minEntry = (minEntry.0, minEntry.1, minEntry.2)
                    } else {
                        minEntry = (entry.0, entry.1, idx)
                    }
                }
            }
            entries[minEntry.2] = (minEntry.0, minEntry.1+minEntry.0)
            maxTime = minEntry.1+minEntry.0
            p -= 1
        }
        
        return maxTime
    }
}
