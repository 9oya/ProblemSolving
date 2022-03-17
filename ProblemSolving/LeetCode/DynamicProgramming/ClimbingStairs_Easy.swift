//
//  ClimbingStairs.swift
//  ProblemSolving
//
//  Created by Eido Goya on 2022/03/01.
//

import Foundation

class ClimbingStairs {
//    print(climbStairs(2)) // 2
//    print(climbStairs(3)) // 3
    
    // Memoization
    func climbStairs(_ n: Int) -> Int {
        
        var arr: [Int] = []
        arr.append(1)
        arr.append(1)
        if n == 1 {
            return 1
        }
        for i in 2...n {
            arr.append(arr[i-1] + arr[i-2])
        }
        return arr[n]
    }
    
    // Reculsion
//    func climbStairs(_ n: Int) -> Int {
//        return stepUp(n, 1) + stepUp(n, 2)
//    }
//
//    func stepUp(_ target: Int, _ next: Int) -> Int {
//        if next > target {
//            return 0
//        } else if next == target {
//            return 1
//        }
//        return stepUp(target, next+1) + stepUp(target, next+2)
//    }
}
