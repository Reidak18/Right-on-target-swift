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
    
    func restartGame()
    func startNewRound() -> Bool
    func calculateScore(with value: Int)
}

class Game: GameProtocol {
    var score: Int = 0
    
    private var minSecretValue: Int
    private var maxSecretValue: Int
    var currentSecretValue: Int
    
    private var lastRound: Int
    private var currentRound: Int = 1
    
    init?(startValue: Int, endValue: Int, rounds: Int) {
        guard startValue <= endValue
        else { return nil }
        
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currentSecretValue = Int.random(in: minSecretValue...maxSecretValue)
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() -> Bool {
        currentSecretValue = Int.random(in: minSecretValue...maxSecretValue)
        currentRound += 1
        return currentRound > lastRound
    }
    
    func calculateScore(with value: Int) {
        score += 50 - abs(value - currentSecretValue)
    }
}
