//
//  체육복.swift
//  ProblemSolving
//
//  Created by Eido Goya on 2021/09/19.
//

import Foundation

class 체육복 {
    //print(solution(5, [2,4], [1,3,5])) // 5
    //print(solution(5, [2,4], [3])) // 4
    //print(solution(3, [3], [1])) // 2
    //print(solution(5, [1, 3], [1, 3, 5])) // 5
    //print(solution(7, [3, 4], [4, 5]))
    //print(solution(5, [2, 4], [3, 1])) // 5

    func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
        var result = 0
        let (_lost, _reserve) = validate(lost, reserve)
        result = lostSuits(n, _lost)
        result = borrow(result, _lost, _reserve)
        return result
    }

    func validate(_ lost: [Int], _ reserve: [Int]) -> ([Int], [Int]) {
        var _lost = lost.sorted()
        var _reserve: [Int] = []
        for r in reserve.sorted() {
            if _lost.contains(r) {
                _lost = _lost.filter { $0 != r }
            } else {
                _reserve.append(r)
            }
        }
        return (_lost, _reserve)
    }

    func lostSuits(_ n: Int, _ lost: [Int]) -> Int {
        var result = 0
        for s in 1...n {
            result += 1
            if lost.contains(s) {
                result -= 1
            }
        }
        return result
    }

    func borrow(_ result: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
        var _result = result
        var _reserve = reserve
        for l in lost {
            for (idx, r) in _reserve.enumerated() {
                if l == r+1 || l == r-1 {
                    _result += 1
                    _reserve.remove(at: idx)
                    break
                }
            }
        }
        return _result
    }
}
