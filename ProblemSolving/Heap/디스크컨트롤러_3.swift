//
//      _3.swift
//  ProblemSolving
//
//  Created by Eido Goya on 2021/09/25.
//

import Foundation

class 디스크컨트롤러 {
    //print(solution([[0, 3], [1, 9], [2, 6]])) // 9
    //print(solution([[0, 3]])) // 9

    //print(solution([[0, 10], [2, 10], [9, 10], [15, 2]])) // 14
    //print(solution([[0, 10], [2, 12], [9, 19], [15, 17]])) // 25
    //print(solution([[0, 3], [1, 9], [2, 6]]), 9)
    //print(solution([[0, 1]]), 1)
    //print(solution([[1000, 1000]]), 1000)
    //print(solution([[0, 1], [0, 1], [0, 1]]), 2)
    //print(solution([[0, 1], [0, 1], [0, 1], [0, 1]]), 2)
    //print(solution([[0, 1], [1000, 1000]]), 500)
    //print(solution([[100, 100], [1000, 1000]]), 500)
    //print(solution([[10, 10], [30, 10], [50, 2], [51, 2]]), 6)
    //print(solution([[0, 3], [1, 9], [2, 6], [30, 3]]), 7)

    func solution(_ jobs:[[Int]]) -> Int {
        var sortedJobs = jobs.sorted{$0[1] < $1[1]}
        var currentTime = 0, answer = 0

        while !sortedJobs.isEmpty {
            var flag = false
            for i in 0 ..< sortedJobs.count {
                if sortedJobs[i][0] <= currentTime {
                    currentTime += sortedJobs[i][1]
                    answer += currentTime - sortedJobs[i][0]
                    sortedJobs.remove(at: i)
                    flag = true
                    break
                }
            }

            if !flag {
                currentTime = sortedJobs.min { a, b in a[0] < b[0] }![0]
            }
        }

        return answer / jobs.count
    }
    
    func solutionBad(_ jobs:[[Int]]) -> Int {

        var _jobs = jobs
        var optJobs: [[Int]] = [_jobs.removeFirst()]
        var cost = optJobs.first![1]

        while _jobs.count > 0 {
            _jobs.sort {
                (abs(cost - $0[0]) + $0[1]) < (abs(cost - $1[0]) + $1[1])
            }
            cost += cost - _jobs.first![0] + _jobs.first![1]
            optJobs.append(_jobs.removeFirst())
        }

        return cost / jobs.count
    }
}
