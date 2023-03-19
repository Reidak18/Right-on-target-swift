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
    private var targetNumber: Int = 0
    private var round = 0
    private var points = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        targetNumber = generateNumber()
        targetNumberLabel.text = "\(targetNumber)"
    }
    
    @IBAction func onCheck(_ sender: UIButton) {
        let sliderValue = Int(slider.value.rounded())
        points += 50 - abs(sliderValue - targetNumber)
        round += 1
        if round >= 5 {
            let alert = UIAlertController(title: "Game finished",
                                          message: "Finish. You earned \(points) points",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Play again",
                                          style: .default,
                                          handler: nil))
            present(alert, animated: true)
            round = 0
            points = 0
        }

        targetNumber = generateNumber()
        targetNumberLabel.text = "\(targetNumber)"
    }
    
    func generateNumber() -> Int {
        return Int.random(in: 1...50)
    }
}

