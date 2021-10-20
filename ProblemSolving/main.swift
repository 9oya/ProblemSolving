//
//  main.swift
//  ProblemSolving
//
//  Created by Eido Goya on 2021/09/19.
//

import Foundation

print(solution(6, [7, 10])) // 28
print(solution(6, [4, 4, 2])) // 8
print(solution(3, [4, 4, 2])) // 4
print(solution(2, [5, 10, 2])) // 4

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

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    
    var entries: [(Int64, Int64)] = [] // (time, accumulation)
//    times.forEach {
//        entries.append((Int64($0), 0))
//    }
    
    entries = times
        .map({ time -> (Int64, Int64) in
            return (Int64(time), 0)
        })
        .sorted {
            $0.0 < $1.0
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
    
    while p > 0 {
        
        var minEtry: (Int64, Int64)
        
        if minEntry.0 == 0 {
            // init
            minEntry = (entry.0, entry.1)
        } else {
            
        }
        
        p -= 1
    }
    
    return maxTime
}

func binarySearch<Element: Comparable>(_ array: Array<Element>, value: Element) -> Int? {
    
    // escaping
    if array.count < 1 {
        return nil
    }
    
    let middle = array.count / 2
    
    if array[middle] == value {
        return middle
    } else if array[middle] > value {
        return binarySearch(Array(array[0...middle-1]), value: value)
    } else {
        return binarySearch(Array(array[middle...array.count-1]), value: value)
    }
    
}

func solution2(_ n:Int, _ times:[Int]) -> Int64 {

    guard let maxInTimes = times.max() else { return 0 }

    var left: Int64 = 0
    var right: Int64 = Int64(maxInTimes * n)
    var mid: Int64 = (left + right) / 2
    var answer: Int64 = right

    while left <= right {
        mid = (left + right) / 2
        var possible: Int64 = 0
        for time in times {
            possible = possible + Int64((Int(mid) / time))
        }
        // n보다 작을 경우 해당 mid 값 보단 더 커야한다.
        if possible >= n {
            answer = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }

    return answer
}

