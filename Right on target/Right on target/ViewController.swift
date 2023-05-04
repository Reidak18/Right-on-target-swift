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
    @IBOutlet weak var imageView: UIImageView!
    
    private let game: GameProtocol = Game(5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game.restartGame()
        targetNumberLabel.text = "\(game.currentSecretValue)"
    }
    
    @IBAction func onCheck(_ sender: UIButton) {
        let sliderValue = Int(slider.value.rounded())
        game.updateScore(with: sliderValue)
        
        if game.isGameEnded {
            let alert = UIAlertController(title: "Game finished",
                                          message: "Finish. You earned \(game.score) points",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Play again",
                                          style: .default, handler: { _ in
                self.game.restartGame()
                self.targetNumberLabel.text = "\(self.game.currentSecretValue)"
            }))
            present(alert, animated: true)
        }
        else {
            game.startNewRound()
            self.targetNumberLabel.text = "\(self.game.currentSecretValue)"
        }
    }
}

