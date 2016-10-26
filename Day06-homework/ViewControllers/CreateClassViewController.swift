//
//  CreateClassViewController.swift
//  Day06-homework
//
//  Created by Enrik on 10/25/16.
//  Copyright © 2016 Enrik. All rights reserved.
//

import UIKit

class CreateClassViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldClassName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldClassName.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    

    @IBAction func actionCreateClass(_ sender: AnyObject) {
        
        if let className = textFieldClassName.text {
            if className != "" {
                DataManager.shared.createNewClass(name: className)
            }
        }
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }

}
