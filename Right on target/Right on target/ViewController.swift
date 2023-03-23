//
//  ViewController.swift
//  Right on target
//
//  Created by Nikita Lukyantsev on 19.03.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var targetNumberLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    private let game = Game(startValue: 1, endValue: 50, rounds: 5)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game.restartGame()
        targetNumberLabel.text = "\(game.currentSecretValue)"
    }
    
    @IBAction func onCheck(_ sender: UIButton) {
        let sliderValue = Int(slider.value.rounded())
        game.calculateScore(with: sliderValue)
        if game.startNewRound() {
            let alert = UIAlertController(title: "Game finished",
                                          message: "Finish. You earned \(game.score) points",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Play again",
                                          style: .default,
                                          handler: nil))
            present(alert, animated: true)
            self.game.restartGame()
        }
        
        self.targetNumberLabel.text = "\(self.game.currentSecretValue)"
    }
}

