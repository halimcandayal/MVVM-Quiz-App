//
//  ResultVC.swift
//  MVVM Quiz App
//
//  Created by Halimcan Dayal on 6.04.2022.
//

import UIKit

class ResultVC: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var result = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = "\(result)"

    }
    

    @IBAction func homeButtonClicked(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
}
