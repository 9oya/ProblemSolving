//
//  기능개발_L2.swift
//  ProblemSolving
//
//  Created by Eido Goya on 2021/10/21.
//

import Foundation

class 기능개발 {
    func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
      var releasFuncsList: [Int] = []
      var ddays: [Int] = []
      var compareDayPosition = 0
      
      // loop for release
      for (idx, item) in progresses.enumerated() {
        
        // loop for cal dday
        var progress: Int = item
        var currDday: Int = 0
        while progress < 100 {
          progress += speeds[idx]
          currDday += 1
        }
        
        // validate release funcs
        if let _ = ddays.last {
          if ddays[compareDayPosition] >= currDday {
            releasFuncsList.append(releasFuncsList.popLast()! + 1)
          } else {
            releasFuncsList.append(1)
            compareDayPosition = (releasFuncsList.reduce(0, +) - 1)
          }
        } else {
          releasFuncsList.append(1)
        }
        
        ddays.append(currDday)
      }
      
      return releasFuncsList
    }
}
