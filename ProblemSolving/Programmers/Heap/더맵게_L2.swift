//
//  더맵게.swift
//  ProblemSolving
//
//  Created by Eido Goya on 2021/09/24.
//

import Foundation

class 더맵게 {
    //print(solution([1, 2, 3, 9, 10, 12], 7)) // 2
//    print(solution([1, 2, 3], 17)) // -1

    func solution(_ scoville: [Int], _ k: Int) -> Int {
        
        var queue: [Int] = scoville.sorted { $0 > $1 }
        var mixedCnt = 0
        
        while queue.count > 0 {
            
            if queue.last ?? 0 >= k {
                break
            }
            let first = queue.popLast()
            let second = queue.popLast() ?? 0
            
            if second == 0 {
                mixedCnt = -1
                break
            }
            
            let new = first! + (second*2)
            mixedCnt += 1
            
            queue.append(new)
            queue.sort { $0 > $1 }
        }
        
        return mixedCnt
    }
}
