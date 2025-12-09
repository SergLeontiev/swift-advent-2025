//
//  Day02.swift
//  AdventOfCode
//
//  Created by Sergey Leontiev on 6. 12. 2025..
//

struct Day02: AdventDay {
  var data: String
  
  func part1() async throws -> Int {
    var answer = 0
    
    let ranges = data.split(separator: ",")
    for range in ranges {
      let bounds = range.split(separator: "-")
      let left = bounds[0]
      let right = bounds[1].filter { $0.isNumber }
      
      for id in Int(left)!...Int(right)! {
        let strId = String(id)
        let count = strId.count
        guard count % 2 == 0 else { continue }
        guard strId.prefix(count / 2) == strId.suffix(count / 2) else { continue }
        answer += id
      }
    }
    
    return answer
  }
}

/*
 99 = 9 + 9 * 10
 1212 = 12 + 12 * 100
 123123 = 123 + 123 * 1000
 38593859 = 3859 + 3859 * 1000
 */
