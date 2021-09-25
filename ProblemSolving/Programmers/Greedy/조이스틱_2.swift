//
//  조이스틱.swift
//  ProblemSolving
//
//  Created by Eido Goya on 2021/09/21.
//

import Foundation

class 조이스틱 {
//    print(solution("JEROEN")) // 56

    func moveLeft(_ array: [Bool], index: Int) -> Int {
        if !array.contains(false) {
            return 0
        }
        var newArray = array
        let newIndex = (index - 1 + array.count) % array.count
        if newArray[newIndex] == true {
            return 1 + moveLeft(newArray, index: newIndex)
        }

        newArray[newIndex] = true
        return min(1 + moveLeft(newArray, index: newIndex), 1 + moveRight(newArray, index: newIndex))
    }

    func moveRight(_ array: [Bool], index: Int) -> Int {
        if !array.contains(false) {
            return 0
        }
        var newArray = array
        let newIndex = (index + 1 + array.count) % array.count
        if newArray[newIndex] == true {
            return 1 + moveRight(newArray, index: newIndex)
        }

        newArray[newIndex] = true
        return min(1 + moveLeft(newArray, index: newIndex), 1 + moveRight(newArray, index: newIndex))
    }

    func solution(_ name:String) -> Int {
        var finishSetting: [Bool] = name.map { $0 == "A" }
        finishSetting[0] = true
        var totalMove = min(moveRight(finishSetting, index: 0), moveLeft(finishSetting, index: 0))
        for char in name {
            var move = Int(char.asciiValue! - Character("A").asciiValue!)
            move = min(26 - move, move)
            totalMove += move
        }
        return totalMove
    }

}
