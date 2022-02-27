//
//  가장큰수_L2.swift
//  ProblemSolving
//
//  Created by Eido Goya on 2022/02/27.
//

import Foundation

//print(solution([6, 10, 2])) //"6210"
//print(solution([3, 30, 34, 5, 9])) //"9534330"
//
//print(solution([1, 10, 100, 1000])) //"1101001000"
//print(solution([0, 0, 0, 0]))
//
//print(solution([9, 998])) // 9989
//print(solution([998998, 99])) // 99998998
//print(solution([30, 3021])) // 303021

class 가장큰수 {

    func solution(_ numbers:[Int]) -> String {
        
        var sortedNumbers: [Int] = numbers
            .sorted { lhs, rhs in
                if prefix(lhs) == prefix(rhs) {
                    if "\(lhs)".count == "\(rhs)".count {
                        return lhs > rhs
                    } else {
                        return compareToMulti(lhs, rhs)
                    }
                }
                return prefix(lhs) > prefix(rhs)
            }
        
        while sortedNumbers.first == 0 && sortedNumbers.count > 1 {
            if sortedNumbers.first == 0 {
                sortedNumbers.removeFirst()
            }
        }
        
        return sortedNumbers.compactMap { "\($0)" }.joined()
    }

    func prefix(_ num: Int) -> Int {
        Int("\(num)".prefix(1)) ?? 0
    }

    func compareToMulti(_ lhs: Int, _ rhs: Int) -> Bool {
        
        let lhsNumStr = "\(lhs)\(lhs)\(lhs)"
        let rhsNumStr = "\(rhs)\(rhs)\(rhs)"
        
        var lhsNum = 0
        var rhsNum = 0
        
        if "\(lhs)".count > "\(rhs)".count {
            rhsNum = Int(rhsNumStr) ?? 0
            lhsNum = Int(lhsNumStr.prefix(rhsNumStr.count)) ?? 0
        } else {
            lhsNum = Int(lhsNumStr) ?? 0
            rhsNum = Int(rhsNumStr.prefix(lhsNumStr.count)) ?? 0
        }
        
        return lhsNum > rhsNum
    }
}
