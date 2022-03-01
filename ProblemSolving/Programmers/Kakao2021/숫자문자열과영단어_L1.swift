//
//  숫자문자열과영단어_Lv1.swift
//  ProblemSolving
//
//  Created by Eido Goya on 2021/11/01.
//

import Foundation

class 숫자문자열과영단어 {
    //print(convertArrToStr(["one", "4", "seven", "eight"]))

    //print(divideStrToArr("one4seveneight"))

    //"one4seveneight"    1478
    //"23four5six7"    234567
    //"2three45sixseven"    234567
    //"123"    123
//    print(solution("one4seveneight" ))

    func solution(_ s:String) -> Int {
        let engMap: [String: Int] = [
            "zero": 0,
            "one": 1,
            "two": 2,
            "three": 3,
            "four": 4,
            "five": 5,
            "six": 6,
            "seven": 7,
            "eight": 8,
            "nine": 9
        ]
        let strArr = divideStrToArr(s, engMap)
        let numArr = convertStrArrToIntArr(strArr, engMap)
        return Int(numArr.map { "\($0)"}.joined())!
    }

    func divideStrToArr(_ s: String,
                        _ engMap: [String:Int]) -> [String] {
        var strArr:[String] = []
        var str: String = ""
        s.forEach { ch in
            str = "\(str)\(ch)"
            
            if let _ = Int(str) {
                strArr.append(str)
                str = ""
                return
            } else if engMap.keys.contains(str) {
                strArr.append(str)
                str = ""
            }
        }
        return strArr
    }

    func convertStrArrToIntArr(_ arr: [String],
                               _ engMap: [String:Int]) -> [Int] {
        var numArr: [Int] = []
        arr.forEach { str in
            if let num = Int(str) {
                numArr.append(num)
                return
            } else if let num = engMap[str] {
                numArr.append(num)
            }
        }
        return numArr
    }
}
