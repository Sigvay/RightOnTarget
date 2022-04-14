//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Александр Меркулов on 11.04.22.
//

import UIKit

class ViewController: UIViewController {
    var number: Int = 0
    var round: Int = 1
    var points: Int = 0
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         print ("viewDidLoad")
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    

    @IBAction func checkNumber (){
        let numSlider = Int(self.slider.value.rounded())
        if numSlider > self.number {
            self.points += 50 - numSlider + self.number
        } else if numSlider < self.number {
            self.points += 50 - self.number + numSlider
        } else {
            self.points += 50
        }
        if self.round == 5 {
            let alert = UIAlertController(
                title: "Игра окончена", message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.round = 1
            self.points = 0
        } else {
            self.round += 1
        }
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
    }
    
    // ленивое свойство для хранения View Controller
    lazy var secondViewController: SecondViewController =
    getSecondViewController()
    
    // приватный метод, загружающий View Controller
    private func getSecondViewController() -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier:
    "SecondViewController")
        return viewController as! SecondViewController
    }
    
    @IBAction func showNextScreen() {
        self.present(secondViewController, animated: true, completion: nil)
    }

}
    



    
