//
//  ViewController.swift
//  MVVM Quiz App
//
//  Created by Halimcan Dayal on 6.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton! {
        didSet {
            playButton.layer.cornerRadius = playButton.frame.height/2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   }

    @IBAction func playButtonClicked(_ sender: Any) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "QuizVC") as? QuizVC else {return}
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

