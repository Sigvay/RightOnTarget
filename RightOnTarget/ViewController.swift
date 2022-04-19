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
        // Создаем экземпляр сущности "Игра"
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        // Обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    
    // MARK: - Взаимодействие View - Model
    @IBAction func checkNumber() {
        // Высчитываем очки за раунд
        game.calculateScore(with: Int(slider.value))
        // Проверяем, окончена ли игра
        if game.isGameEnded {
            showAlertWith(score: game.score)
            // Начинаем игру заново
            game.restartGame()
        } else {
            game.startNewRound()
        }
        // Обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    
    
    // MARK: - Обновление View
    private func updateLabelWithSecretNumber(newText: String ) {
        label.text = newText
    }
    
    
    // Отображение всплывающего окна со счетом
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(
            title: "Игра окончена",
            message: "Вы заработали \(score) очков",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style:
                                            .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}






