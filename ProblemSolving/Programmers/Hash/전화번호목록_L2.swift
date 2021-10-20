//
//  전화번호목록.swift
//  ProblemSolving
//
//  Created by Eido Goya on 2021/09/25.
//

import Foundation

class 전화번호목록 {
//    print(solution(["119", "97674223", "1195524421"])) // false
//    print(solution(["123","456","789"])) // true
//    print(solution(["12","123","1235","567","88"])) // false

    func solution(_ phoneBook: [String]) -> Bool {
        var preNumArr: [String] = []
        for (idx, phNum) in phoneBook.enumerated() {
            preNumArr += phoneBook
                .enumerated()
                .filter {
                    (idx != $0.offset) && ($0.element.contains(phNum))
                }
                .map {
                    $0.element
                }
        }
        return preNumArr.count <= 0
    }
}
