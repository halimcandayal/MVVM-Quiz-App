//
//  QuizCVCell.swift
//  MVVM Quiz App
//
//  Created by Halimcan Dayal on 6.04.2022.
//

import UIKit

enum SelectedOption {
    
    case optionA
    case optionB
    case optionC
    case optionD
}

class QuizCVCell: UICollectionViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var option1: UILabel!
    @IBOutlet weak var option2: UILabel!
    @IBOutlet weak var option3: UILabel!
    @IBOutlet weak var option4: UILabel!
    
    @IBOutlet weak var optionA: UIControl!
    @IBOutlet weak var optionB: UIControl!
    @IBOutlet weak var optionC: UIControl!
    @IBOutlet weak var optionD: UIControl!
    
    private var correctAnswer: String?
    
    var setValues: Questions? {
        didSet {
            questionLabel.text = setValues?.question
            option1.text = setValues?.option_1
            option2.text = setValues?.option_2
            option3.text = setValues?.option_3
            option4.text = setValues?.option_4
            
            correctAnswer = setValues?.correct_answer
        }
        
    }
    
    override func prepareForReuse() {
        
        updateBorder(myview: optionA)
        updateBorder(myview: optionB)
        updateBorder(myview: optionC)
        updateBorder(myview: optionD)
    }
    
    var selectedOption: ((_ selectedAnswer: Bool) -> Void)?
    
    @IBAction func option1Clicked(_ sender: Any) {
        
        var isCorrect = false
        
        if correctAnswer == setValues?.option_1 {
            isCorrect = true
        }
        selectedOption?(isCorrect)
        changeBorder(selectedOption: .optionA)
        
    }

    @IBAction func option2Clicked(_ sender: Any) {
        
        var isCorrect = false
        
        if correctAnswer == setValues?.option_2 {
            isCorrect = true
        }
        selectedOption?(isCorrect)
        changeBorder(selectedOption: .optionB)
    }
    
    @IBAction func option3Clicked(_ sender: Any) {
        
        var isCorrect = false
        
        if correctAnswer == setValues?.option_3 {
            isCorrect = true
        }
        selectedOption?(isCorrect)
        changeBorder(selectedOption: .optionC)
    }
    
    @IBAction func option4Clicked(_ sender: Any) {
        
        var isCorrect = false
        
        if correctAnswer == setValues?.option_4 {
            isCorrect = true
        }
        selectedOption?(isCorrect)
        changeBorder(selectedOption: .optionD)
    }
    
    func changeBorder(selectedOption: SelectedOption) {
        
        switch selectedOption {
        
        case .optionA:
            updateBorder(myview: optionA, borderWidth: 4)
            updateBorder(myview: optionB)
            updateBorder(myview: optionC)
            updateBorder(myview: optionD)
        
        case .optionB:
            updateBorder(myview: optionB, borderWidth: 4)
            updateBorder(myview: optionA)
            updateBorder(myview: optionC)
            updateBorder(myview: optionD)
        
        case .optionC:
            updateBorder(myview: optionC, borderWidth: 4)
            updateBorder(myview: optionA)
            updateBorder(myview: optionB)
            updateBorder(myview: optionD)
        
        case .optionD:
            updateBorder(myview: optionD, borderWidth: 4)
            updateBorder(myview: optionA)
            updateBorder(myview: optionB)
            updateBorder(myview: optionC)
        }
    }
    
    
    func updateBorder(myview: UIView, borderWidth: CGFloat = 0) {
        
        myview.layer.borderWidth = borderWidth
        myview.layer.borderColor = UIColor.white.cgColor
        
    }
}
