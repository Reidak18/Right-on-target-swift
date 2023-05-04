//
//  GameRound.swift
//  Right on target
//
//  Created by Nikita Lukyantsev on 23.03.2023.
//

import Foundation

protocol GameRoundProtocol {
    var currentSecretValue: Int { get }
    
    func start()
    func calculateScore(with: Int) -> Int
}

class GameRound: GameRoundProtocol {
    private(set) var currentSecretValue: Int = 0
    private let secretValueGenerator: GeneratorProtocol = SimpleRandomGenerator(1, 50)
    
    func start() {
        currentSecretValue = secretValueGenerator.getRandomValue()
    }
    
    func calculateScore(with value: Int) -> Int {
        let currentScore = 50 - abs(value - currentSecretValue)
        print("You value: \(value). Target value: \(currentSecretValue). You earned: \(currentScore)")
        return currentScore
    }
}
