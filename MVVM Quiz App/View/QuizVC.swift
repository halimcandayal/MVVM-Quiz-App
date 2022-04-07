//
//  QuizVC.swift
//  MVVM Quiz App
//
//  Created by Halimcan Dayal on 6.04.2022.
//

import UIKit

class QuizVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = QuestionViewModel()
    var quesitions: [Questions]?
    
    var answerSelected = false
    var isCorrectAnswer = false
    
    var points = 0
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.apiToGetQuestionData { [weak self] in
            self?.quesitions = self?.viewModel.questionData?.data?.questions
                    
            DispatchQueue.main.async {
                self?.collectionView.delegate = self
                self?.collectionView.dataSource = self
                self?.collectionView.reloadData()
            }
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func exitButtonClicked(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        if !answerSelected {
            
            let alert = UIAlertController(title: "Select One Option", message: "Please select one option before moving to the next question.", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
            return
            
        }
        answerSelected = false
        if isCorrectAnswer {
            points += 1
        }
        if index<(self.quesitions?.count ?? 0) - 1 {
            index += 1
            collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .right, animated: true)
        }else {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultVC else {return}
            vc.result = points
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    

}

extension QuizVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return quesitions?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCVCell", for: indexPath) as? QuizCVCell else { return QuizCVCell() }
        cell.optionA.layer.cornerRadius = 7
        cell.optionB.layer.cornerRadius = 7
        cell.optionC.layer.cornerRadius = 7
        cell.optionD.layer.cornerRadius = 7
        cell.setValues = quesitions?[indexPath.row]
        cell.selectedOption = { [weak self] isCorrect in
            self?.answerSelected = true
            self?.isCorrectAnswer = isCorrect
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    

}

