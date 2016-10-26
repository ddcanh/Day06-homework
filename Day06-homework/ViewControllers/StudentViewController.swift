//
//  StudentViewController.swift
//  Day06-homework
//
//  Created by Enrik on 10/25/16.
//  Copyright © 2016 Enrik. All rights reserved.
//

import UIKit

class StudentViewController: UIViewController {

    var classIT: ClassEntity!
    var students = [StudentEntity]()
    
    @IBOutlet weak var studentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavigationBarButton()
        studentTableView.delegate = self
        studentTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadData()
        studentTableView.reloadData()
    }
    
    func loadData() {
        students.removeAll()
        if (classIT.students?.count)! > 0 {
            for student in classIT.students! {
                students.append(student as! StudentEntity)
            }
        }
    }
    
    func addNavigationBarButton() {
//        let buttonCreateStudent = UIBarButtonItem(image: UIImage(named: "addButton"), style: .plain, target: self, action: #selector(showViewCreateNewStudent))
        let buttonCreate = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        buttonCreate.setImage(UIImage(named: "addButton"), for: .normal)
        buttonCreate.addTarget(self, action: #selector(showViewCreateNewStudent), for: .touchUpInside)
        let rightBarItem = UIBarButtonItem()
        rightBarItem.customView = buttonCreate
        
        self.navigationItem.rightBarButtonItems = [rightBarItem]
    }
    
    
    func showViewCreateNewStudent() {
        let createStudentVC = self.storyboard?.instantiateViewController(withIdentifier: "CreateStudentViewController") as! CreateStudentViewController
        
        createStudentVC.classIT = self.classIT
        
        self.navigationController?.pushViewController(createStudentVC, animated: true)
    
    }
}

extension StudentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let edit = UITableViewRowAction(style: .destructive, title: "DELETE") { (action, index) in
            DataManager.shared.deleteStudent(student: self.students[indexPath.row])
            self.loadData()
            self.studentTableView.reloadData()
        }
        edit.backgroundColor = UIColor(red: 200/255, green: 123/255, blue: 100/255, alpha: 1)
        
        return [edit]
    }
}

extension StudentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = studentTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! StudentTableViewCell
        
        let student = students[indexPath.row]
        
        cell.labelStudentName.text = student.name
        cell.labelStudentAddress.text = student.address
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        cell.labelStudentBirthday.text = dateFormatter.string(from: student.birthday as! Date)
        
        cell.imageAvatar.image = UIImage(data: student.image as! Data)
        cell.imageAvatar.contentMode = .scaleAspectFit
        
        return cell
    }
}

