//
//  모의고사_L1.swift
//  ProblemSolving
//
//  Created by Eido Goya on 2022/02/22.
//

import Foundation

class 모의고사 {
    
//    print(solution([1,2,3,4,5])) //[1]
//    print(solution([1,3,2,4,2])) //[1,2,3]
//
//    print(solution([4,4,4,2,2])) //[0]
    
    
    func solution(_ answers:[Int]) -> [Int] {
        
        var score = [0, 0, 0]
        var result: [Int] = []
        
        let students = [
            [1, 2, 3, 4, 5],
            [2, 1, 2, 3, 2, 4, 2, 5],
            [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
        ]
        
        for (idx, answer) in answers.enumerated() {
            
            // score up
            if answer == students[0][(idx % students[0].count)] {
                score[0] += 1
            }
            if answer == students[1][(idx % students[1].count)] {
                score[1] += 1
            }
            if answer == students[2][(idx % students[2].count)] {
                score[2] += 1
            }
            
            // compare
            var max = score[result.first == nil ? 0 : result.first!-1]
            
            result.removeAll()
            
            if max < score[1] {
                result.removeAll()
                result.append(2)
                max = score[1]
            } else if max == score[1] {
                result.append(2)
            }
            
            if max < score[2] {
                result.removeAll()
                result.append(3)
                max = score[2]
            } else if max == score[2] {
                result.append(3)
            }
            
            if max < score[0] {
                result.removeAll()
                result.append(1)
                max = score[0]
            } else if max == score[0] {
                result.append(1)
            }
        }
        
        return result.sorted()
    }
}
