//
//  신고결과받기_L1.swift
//  ProblemSolving
//
//  Created by Eido Goya on 2022/02/26.
//

import Foundation

//print(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2)) // [2,1,1,0]
//print(solution(["con", "ryan"], ["ryan con", "ryan con", "ryan con", "ryan con"], 3)) // [0, 0]

class 신고결과받기 {

    func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
        
        // init
        var reported: [String: [String]] = [:]
        for id in id_list {
            reported[id] = []
        }
        
        // traversal
        for rpStr in report {
            let (from, to) = split(rpStr)
            
            // validate duplication
            if !(reported[to]?.contains(from) ?? false) {
                // append
                reported[to]!.append(from)
            }
        }
        
        let resultDict: [Int:Int] = calculate(id_list,
                                              reported,
                                              k)
        
        var result: [Int] = []
        for key in 0..<id_list.count {
            result.append(resultDict[key]!)
        }
        
        return result
    }

    func split(_ reportStr: String) -> (String, String) {
        let from = String(reportStr.split(separator: " ").first!)
        let to = String(reportStr.split(separator: " ").last!)
        return (from, to)
    }


    func calculate(_ id_list:[String],
                   _ reported: [String: [String]],
                   _ k: Int) -> [Int:Int] {
        
        // init
        var sent: [String:Int] = [:]
        for id in id_list {
            sent[id] = 0
        }
        
        // traversal
        for to in reported.keys {
            // valdate with report count (k)
            if (reported[to]!.count/k) > 0 {
                for from in reported[to]! {
                    // increase
                    sent[from]! += 1
                }
            }
        }
        
        // calculate
        var result: [Int:Int] = [:]
        for fromDict in sent {
            result[id_list.firstIndex(of: fromDict.key)!] = fromDict.value
        }
        
        return result
    }
}
