//
//  ClassesViewController.swift
//  Day06-homework
//
//  Created by Enrik on 10/24/16.
//  Copyright © 2016 Enrik. All rights reserved.
//

import UIKit

class ClassesViewController: UIViewController {

    @IBOutlet weak var classesTableView: UITableView!
    
    var classes = [ClassEntity]()
    var isViewingCreatClassViewController: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        classesTableView.delegate = self
        classesTableView.dataSource = self
        
        title = "Classes"

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadData()
        classesTableView.reloadData()
    }
    func loadData() {
        guard let classes = DataManager.shared.listAllClasses()
        else {
            return
        }
        self.classes = classes
    }
    
    @IBAction func actionShowCreateClassViewController(_ sender: AnyObject) {
      
        
        if !isViewingCreatClassViewController {
            
            let blurView = UIView()
            blurView.frame = self.view.frame
            blurView.backgroundColor = UIColor.clear
            self.view.addSubview(blurView)
            blurView.tag = 101
            
            let createClassViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreateClassViewController") as! CreateClassViewController
            self.addChildViewController(createClassViewController)
            createClassViewController.view.frame = CGRect(x: 20, y: 130, width: self.view.frame.width - 40, height: 300)
            
            createClassViewController.didMove(toParentViewController: self)
            blurView.addSubview(createClassViewController.view)
            
            isViewingCreatClassViewController = true
        } else {
            if let createClassViewController = self.childViewControllers[0] as? CreateClassViewController {
                createClassViewController.removeFromParentViewController()
                createClassViewController.view.removeFromSuperview()
                isViewingCreatClassViewController = false
            }
            for view in self.view.subviews {
                if view.tag == 101 {
                    view.removeFromSuperview()
                }
            }
            
            self.loadData()
            classesTableView.reloadData()

        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

extension ClassesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let edit = UITableViewRowAction(style: .destructive, title: "DELETE") { (action, index) in
            let classIT = self.classes[indexPath.row]
            DataManager.shared.deleteClass(classIT: classIT)
            self.loadData()
            self.classesTableView.reloadData()
        }
        edit.backgroundColor = UIColor(red: 200/255, green: 123/255, blue: 100/255, alpha: 1)
       
        return [edit]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let studentVC = self.storyboard?.instantiateViewController(withIdentifier: "StudentViewController") as! StudentViewController
        studentVC.classIT = classes[indexPath.row]
        self.navigationController?.pushViewController(studentVC, animated: true)
    }
}

extension ClassesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = classesTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ClassTableViewCell
        
        cell.labelClassName.text = classes[indexPath.row].name
        
        if let numberStudents = classes[indexPath.row].students?.count {
            cell.labelNumberOfStudents.text = String(describing: numberStudents)
        } else {
            cell.labelNumberOfStudents.text = "0"
        }
        
        
        return cell
    }
}
