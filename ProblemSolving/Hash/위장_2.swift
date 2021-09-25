//
//  위장_2.swift
//  ProblemSolving
//
//  Created by Eido Goya on 2021/09/25.
//

import Foundation

class 위장 {
//    print(solution([["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]])) // 5
//    print(solution([["crowmask", "face"], ["bluesunglasses", "face"], ["smoky_makeup", "face"]])) // 3

    func solution(_ clothes:[[String]]) -> Int {
        
        var dynamicDict: [String:[String]] = [:]
        for item in clothes {
            if dynamicDict.keys.contains(item[1]) {
                dynamicDict[item[1]]?.append(item[0])
            } else {
                dynamicDict[item[1]] = [item[0]]
            }
        }
        
        var combinations = 0
        for (_, clothesArr) in dynamicDict {
            if combinations == 0 {
                combinations += (clothesArr.count+1)
            } else {
                combinations *= (clothesArr.count+1)
            }
        }
        
        return combinations-1
    }
}
