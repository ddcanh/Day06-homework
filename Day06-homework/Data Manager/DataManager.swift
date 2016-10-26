//
//  DataManager.swift
//  Day06-homework
//
//  Created by Enrik on 10/24/16.
//  Copyright © 2016 Enrik. All rights reserved.
//

import UIKit
import CoreData

class DataManager {
    static let shared: DataManager = DataManager()
    
    func createNewStudent(name: String, address: String, birthday: NSDate, imageData: NSData, classIT: ClassEntity) {
        

        let context = self.persistentContainer.viewContext
        
        let student = StudentEntity(context: context)
        
        student.name = name
        student.address = address
        student.birthday = birthday
        student.image = imageData

        student.addToClasses(classIT)
        classIT.addToStudents(student)
        do {
            try self.saveContext()
            print("save Student OK")
        } catch  {
            print(error)
        }
    }
    
    func createNewClass(name: String) {
        

        let context = self.persistentContainer.viewContext
        
        let classIT = ClassEntity(context: context)
        classIT.name = name
        
        do {
            try self.saveContext()
        } catch {
            print(error)
        }
    }
    
    func deleteClass(classIT: ClassEntity) {
        let context = self.persistentContainer.viewContext
        context.delete(classIT)
        
        do {
            try self.saveContext()
        } catch {
            print(error)
        }
    }
    
    func deleteStudent(student: StudentEntity) {
        let context = self.persistentContainer.viewContext
        context.delete(student)
        
        do {
            try self.saveContext()
        } catch {
            print(error)
        }

    }
    
    func listAllClasses() -> [ClassEntity]? {
        

        let context = self.persistentContainer.viewContext
        
        do {
            let fetchResults = try context.fetch(ClassEntity.fetchRequest())
            
            return fetchResults as? [ClassEntity]
        } catch {
            print(error)
            return nil
        }
    }
    
    
    func addStudentToClass(student: StudentEntity, classIT: ClassEntity) {
        classIT.students?.adding(student)
    }
    
    func listAllStudentWith(className: String) -> NSSet? {
        let classes = listAllClasses()
        for eachClass in classes! {
            if eachClass.name == className {
                return eachClass.students
            }
        }
        return nil
    }
    
    // MARK: - Core Data stack
    
    
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "Day06_homework")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () throws {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            try context.save()
        }
    }

    
}
