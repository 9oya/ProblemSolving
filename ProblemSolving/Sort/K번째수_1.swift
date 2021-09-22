//
//  K번째수.swift
//  ProblemSolving
//
//  Created by Eido Goya on 2021/09/19.
//

import Foundation

class K번째수 {
//    print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]])) // [5, 6, 3]

    func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
        
        var result: [Int] = []
        
        // loop commands
        for command in commands {
            let i = command[0], j = command[1], k = command[2]
            let truncArr = truncateArray(array, i: i, j: j)
            let sortedArr = sortArray(truncArr)
            result.append(select(sortedArr, k: k))
        }
        
        return result
    }


    func truncateArray(_ array:[Int], i: Int, j: Int) -> [Int] {
        let result = array[i-1..<j]
        return Array(result)
    }

    func sortArray(_ array: [Int]) -> [Int] {
        let result = array.sorted {
            $0 < $1
        }
        return result
    }

    func select(_ array: [Int], k: Int) -> Int {
        let result = array[k-1]
        return result
    }
}
