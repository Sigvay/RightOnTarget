//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Александр Меркулов on 11.04.22.
//

import UIKit

class ViewController: UIViewController {
    var game: Game!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    
    // MARK: - Жизненный цикл
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    
    // MARK: - Взаимодействие View - Model
    @IBAction func checkNumber(){
        game.calculateScore(with: Int(slider.value))
        if game.isGameEnded {
            showAlertWith(score: game.score)
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    
    
    // MARK: - Обновление View
    private func updateLabelWithSecretNumber(newText: String){
        label.text = newText
    }
    
    
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(title: "Игра окончена!", message: "Вы заработали \(score) очков", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
    }
    
}
    



    
