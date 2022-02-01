//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var smileLabel: UILabel!
    
    var result: [Answer]!
    
    private var finalAnimal: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateAnimal()
    }
    
    private func calculateAnimal() {
        var numOfAnimals: [Animal: Int] = [:]
        result.forEach { numOfAnimals[$0.animal, default: 0] += 1 }
        finalAnimal = numOfAnimals.sorted { $0.1 > $1.1 }.first?.key
        describesAnimal()
    }
    
    private func describesAnimal() {
        descriptionLabel.text = finalAnimal?.definition ?? ""
        smileLabel.text = "Вы - \(finalAnimal?.rawValue ?? "⛔️")"
    }
  
}
