//
//  Model.swift
//  Bowling
//
//  Created by Julian Caicedo on 02.10.18.
//  Copyright © 2018 Julian Caicedo. All rights reserved.
//

import Foundation

class Game {
  
  private var rolls = [Int](repeating: 0, count: 21)
  private var currentRoll = 0
  
  func roll(pins: Int) {
    rolls[currentRoll] = pins
    currentRoll += 1
  }
  
  var score: Int {
    var tempScore = 0
    var index = 0
    for _ in 1...10 {
      if isStrike(index) {
        tempScore += 10 + strikeBonus(for: index)
        index += 1
      } else if isSpare(index) {
        tempScore += 10 + spareBonus(for: index)
        index += 2
      } else {
        tempScore += simpleScore(for: index)
        index += 2
      }
    }
    return tempScore
  }
  
}

extension Game {
  
  func isStrike(_ index: Int) -> Bool {
    return rolls[index] == 10
  }
  
  func isSpare(_ index: Int) -> Bool {
    return rolls[index] + rolls[index + 1] == 10
  }
  
  func strikeBonus(for index: Int) -> Int {
    return rolls[index + 1] + rolls[index + 2]
  }
  
  func spareBonus(for index: Int) -> Int {
    return rolls[index + 2]
  }
  
  func simpleScore(for index: Int) -> Int {
    return rolls[index] + rolls[index + 1]
  }
  
}
