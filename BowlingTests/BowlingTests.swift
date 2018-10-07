//
//  BowlingTests.swift
//  BowlingTests
//
//  Created by Julian Caicedo on 02.10.18.
//  Copyright © 2018 Julian Caicedo. All rights reserved.
//

@testable import Bowling
import XCTest

class BowlingTests: XCTestCase {
  
  var game: Game!
  
  override func setUp() {
    super.setUp()
    game = Game()
  }
  
  override func tearDown() {
    game = nil
    super.tearDown()
  }
  
  func testWorstPlayerEver() {
    roll(repeating: 20, pins: 0)
    XCTAssert(game.score == 0)
  }
  
  func testAllOnes() {
    roll(repeating: 20, pins: 1)
    XCTAssert(game.score == 20)
  }
  
  func testOneSpare() {
    rollSpare()
    game.roll(pins: 2)
    roll(repeating: 17, pins: 0)
    XCTAssert(game.score == 14)
  }
  
  func testOneStrike() {
    rollStrike()
    game.roll(pins: 1)
    game.roll(pins: 8)
    roll(repeating: 16, pins: 0)
    XCTAssert(game.score == 28)
  }
  
  func testPerfectGame() {
    roll(repeating: 12, pins: 10)
    XCTAssert(game.score == 300)
  }
  
  func test3Balls() {
    roll(repeating: 18, pins: 2)
    game.roll(pins: 10)
    game.roll(pins: 5)
    game.roll(pins: 5)
    XCTAssert(game.score == 56)
  }
  
  func testAllSpares() {
    roll(repeating: 20, pins: 5)
    XCTAssert(game.score == 145)
  }
  
}

extension BowlingTests {
  
  func roll(repeating times: Int, pins: Int) {
    for _ in 1...times {
      game.roll(pins: pins)
    }
  }
  
  func rollSpare() {
    roll(repeating: 2, pins: 5)
  }
  
  func rollStrike() {
    game.roll(pins: 10)
  }
  
}
