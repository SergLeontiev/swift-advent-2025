//
//  Day01.swift
//  AdventOfCode
//
//  Created by Sergey Leontiev on 2. 12. 2025..
//

struct Day01: AdventDay {
  var data: String
  
  func part1() async throws -> Int {
    data
      .split(separator: "\n")
      .reduce((position: 50, count: 0)) { result, line in
        let indicator = line.first!
        let distance = Int(String(line.dropFirst()))!
        
        let direction = indicator == "L" ? -1 : 1
        let newPosition = (result.position + distance * direction) % 100
        let updatedCount = result.count + (newPosition == 0 ? 1 : 0)
        
        return (newPosition, updatedCount)
      }
      .count
  }
  
  func part2() async throws -> Int {
    data
      .split(separator: "\n")
      .reduce((position: 50, count: 0)) { result, line in
        let indicator = line.first!
        let distance = Int(String(line.dropFirst()))!
        
        let direction = indicator == "L" ? -1 : 1
        let newPosition = result.position + distance * direction
        
        let crossings = stride(
          from: result.position + direction,
          through: newPosition,
          by: direction
        )
          .filter { $0 % 100 == 0 }
          .count
        
        return (newPosition % 100, result.count + crossings)
      }
      .count
  }
}
