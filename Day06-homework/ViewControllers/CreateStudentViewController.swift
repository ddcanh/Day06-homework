//
//  CreateStudentViewController.swift
//  Day06-homework
//
//  Created by Enrik on 10/25/16.
//  Copyright © 2016 Enrik. All rights reserved.
//

import UIKit

class CreateStudentViewController: UIViewController {
    var classIT: ClassEntity!
    
    
    @IBOutlet weak var textFieldStudentName: UITextField!
    
    @IBOutlet weak var textFieldStudentAddress: UITextField!
    
    @IBOutlet weak var imageStudent: UIImageView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    var studentName: String!
    var studentAddress: String!
    var studentBirthday: NSDate!
    var studentImage: NSData!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldStudentName.delegate = self
        textFieldStudentAddress.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    @IBAction func actionAddPhoto(_ sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false 
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
    
    }

    
    @IBAction func actionCreateStudent(_ sender: AnyObject) {
        
        let name = textFieldStudentName.text
        let address = textFieldStudentAddress.text
        
        if (name?.characters.count)! >= 1{
            if (address?.characters.count)! >= 1{
                if imageStudent.image != nil {
                    if let imageData = UIImageJPEGRepresentation(imageStudent.image!, 1.0) as NSData! {
                        self.studentName = name
                        self.studentAddress = address
                        
                        self.studentImage = imageData
                        self.studentBirthday = datePicker.date as NSDate!
                        DataManager.shared.createNewStudent(name: studentName, address: studentAddress, birthday: studentBirthday, imageData: studentImage, classIT: classIT)
                    }
                }
            }
        }
 
    }

}

extension CreateStudentViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageStudent.contentMode = .scaleAspectFit
            self.imageStudent.image = pickedImage
            
        }
        
        dismiss(animated: true, completion: nil)
    }

}

extension CreateStudentViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

