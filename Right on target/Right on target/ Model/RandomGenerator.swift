//
//  RandomGenerator.swift
//  Right on target
//
//  Created by Nikita Lukyantsev on 23.03.2023.
//

import Foundation

protocol GeneratorProtocol {
    func getRandomValue() -> Int
}

class SimpleRandomGenerator: GeneratorProtocol {
    private var minSecretValue: Int
    private var maxSecretValue: Int
    
    init(_ minSecretValue: Int, _ maxSecretValue: Int) {
        self.minSecretValue = minSecretValue
        self.maxSecretValue = maxSecretValue
    }
    
    func getRandomValue() -> Int {
        return Int.random(in: minSecretValue...maxSecretValue)
    }
}
