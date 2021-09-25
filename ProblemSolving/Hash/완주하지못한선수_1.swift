//
//  완주하지못한선수.swift
//  ProblemSolving
//
//  Created by Eido Goya on 2021/09/25.
//

import Foundation

class 완주하지못한선수 {
//    print(solution(["leo", "kiki", "eden"], ["eden", "kiki"])) // "leo"
//    print(solution(["marina", "josipa", "nikola", "vinko", "filipa"], ["josipa", "filipa", "marina", "nikola"])) // "vinko"
//    print(solution(["mislav", "stanko", "mislav", "ana"], ["stanko", "ana", "mislav"])) // "mislav"

    func solution(_ participant: [String], _ completion: [String]) -> String {
        var _participant = participant
        var _completion = completion
        
        for (i, part) in participant.enumerated() {
            let j = _completion.firstIndex(of: part)
            if j != nil {
                _completion.remove(at: j!)
                _participant[i] = ""
            }
        }
        
        return _participant.filter { $0 != "" }.first!
    }

}
