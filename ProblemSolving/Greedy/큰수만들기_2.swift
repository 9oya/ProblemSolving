//
//  큰수만들기.swift
//  ProblemSolving
//
//  Created by Eido Goya on 2021/09/22.
//

import Foundation


class 큰수만들기 {
    //print(solution("1924", 2)) // 94
//    print(solution("1231234", 3)) // 3234
    //print(solution("4177252841", 4)) // 775841

    func solution(_ number:String, _ k:Int) -> String {
        var stack: [Int] = []

        number
            .map { Int(String($0))! }
            .enumerated()
            .forEach { i,e in
                while stack.last ?? 10 < e {
                    if i-k > stack.count-1 { break }
                    stack.removeLast()
                }

                stack.append(e)
        }

        return stack[0..<number.count-k].reduce("") { String($0) + String($1) }
    }
}
