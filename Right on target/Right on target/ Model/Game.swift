//
//  Game.swift
//  Right on target
//
//  Created by Nikita Lukyantsev on 23.03.2023.
//

import Foundation

protocol GameProtocol {
    var score: Int { get }
    var currentSecretValue: Int { get }
    var isGameEnded: Bool { get }
    
    func restartGame()
    func startNewRound()
    func updateScore(with: Int)
}

class Game: GameProtocol {
    var score: Int = 0
    private let currentRound: GameRoundProtocol = GameRound()
    
    private let roundsCount: Int
    private var currentRountNumber = 0
    
    var currentSecretValue: Int {
        get {
            return currentRound.currentSecretValue
        }
    }
    var isGameEnded: Bool {
        get {
            return currentRountNumber >= roundsCount
        }
    }
    
    init(_ roundsCount: Int) {
        self.roundsCount = roundsCount
    }
    
    func restartGame() {
        score = 0
        currentRountNumber = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentRountNumber += 1
        currentRound.start()
    }
    
    func updateScore(with value: Int) {
        score += currentRound.calculateScore(with: value)
    }
}
