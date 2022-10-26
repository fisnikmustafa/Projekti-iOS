//
//  DatabaseHelper.swift
//  FIEK Portal
// 
//  Created by Fisnik on 23/09/2022.
//

import Foundation
import UIKit
import CoreData

class DatabaseHelper {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let customAlert = InfoAlert()
    
    func professorEntityIsEmpty() -> Bool{
        var items: [Professor]?
        
        do{
            items = try context.fetch(Professor.fetchRequest())
            
            return items?.count == 0
        } catch let error as NSError{
            print("Error: \(error.debugDescription)")
            return true
        }
    }
    
    func fetchProfessor(username: String, password: String) -> [Professor]{
        var items: [Professor]?
        
        do{
            let request = Professor.fetchRequest() as NSFetchRequest<Professor>
            
            let pred = NSPredicate(format: "username LIKE %@ AND password LIKE %@", username, password)
            request.predicate = pred
            
            items = try context.fetch(request)
        } catch{
            // to do: handling
        }
        
        return items!
    }
    
    func fetchStudents() -> [Student]{
        var items: [Student]?
        
        do{
            items = try context.fetch(Student.fetchRequest())
        } catch{
          // to do: handling
        }
        
        return items!
    }
    
    
    //functions for BONUS items:
    func fetchBonuses() -> [Bonus]{
        var items: [Bonus]?
        
        do{
            items = try context.fetch(Bonus.fetchRequest())
        } catch{
          // to do: handling
        }
        
        return items!
        
    }
    
    
    func createBonusItem(professor: Professor, studentName: String, course: String, value: Int64, viewController: UIViewController){
       
        if(!validateFields(professor: professor, studentName: studentName, courseName: course)){
            customAlert.showAlert(with: "Invalid entries!", message: "Make sure you type an existing student and an existing course!\nPlease, try again!", on: viewController)
            return
        }
        
        let newItem = Bonus(context: context)
        for student in professor.students! {
            if ((student as! Student).name == studentName) {
                newItem.student = (student as! Student)
            }
        }
        newItem.course = course
        newItem.value = value
        
        do{
            try context.save()
        } catch{
            customAlert.showAlert(with: "Could not add the item!", message: "Make sure you type an existing student and an existing course!\nPlease, try again!", on: viewController)
        }
        
    }
    
    func deleteBonusItem(item: Bonus, viewController: UIViewController){
        context.delete(item)
        
        do{
            try context.save()
        } catch{
            customAlert.showAlert(with: "Error!", message: "Could not delete the item!", on: viewController)
        }
    }
    
    func updateBonusItem(item: Bonus, activeProfessor: Professor, newStudent: String, newCourse: String, newValue: Int64, viewController: UIViewController){
        
        if(!validateFields(professor: activeProfessor, studentName: newStudent, courseName: newCourse)){
            customAlert.showAlert(with: "Invalid entries!", message: "Make sure you type an existing student and an existing course!\nPlease, try again!", on: viewController)
            return
        }
        
        for student in activeProfessor.students! {
            if ((student as! Student).name == newStudent) {
                item.student = (student as! Student)
            }
        }
        
        item.course = newCourse
        item.value = newValue
        
        do{
            try context.save()
        } catch{
            customAlert.showAlert(with: "Could not edit the item!", message: "Make sure you type an existing student and an existing course!\nPlease, try again!", on: viewController)
        }
    }
    
    func validateFields(professor: Professor, studentName: String, courseName: String) -> Bool{
        for student in professor.students! {
            if ((student as! Student).name == studentName) {
                if(courseName == professor.firstCourse || courseName == professor.secondCourse){
                    return true
                }
            }
        }
        return false
    }
    
    
    //-----------------------
    func clearDatabase(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        let fetchRequest1 = NSFetchRequest<NSFetchRequestResult>(entityName: "Professor")
        let fetchRequest2 = NSFetchRequest<NSFetchRequestResult>(entityName: "Bonus")

        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        let batchDeleteRequest1 = NSBatchDeleteRequest(fetchRequest: fetchRequest1)
        let batchDeleteRequest2 = NSBatchDeleteRequest(fetchRequest: fetchRequest2)

        do {
            try context.execute(batchDeleteRequest)
            try context.execute(batchDeleteRequest1)
            try context.execute(batchDeleteRequest2)
        } catch {
            // Error Handling
        }
    }
    
    func fillDatabase(){
        // Here we will improvise an external database by adding some data in our local database when the application starts
        
        let professor = Professor(context: context)
        professor.name = "John Doe"
        professor.username = "john.doe"
        professor.password = "fiek-2022"
        professor.firstCourse = "Networking"
        professor.secondCourse = "Data Security"
        
        let student = Student(context: context)
        student.name = "Fisnik Mustafa"
        student.firstCourseAttendance = 7
        student.secondCourseAttendance = 6
        student.projectPoints = 30
        
        let student1 = Student(context: context)
        student1.name = "Fidan Hoxha"
        student1.firstCourseAttendance = 6
        student1.secondCourseAttendance = 6
        student1.projectPoints = 29
        
        let student2 = Student(context: context)
        student2.name = "Festim Braha"
        student2.firstCourseAttendance = 7
        student2.secondCourseAttendance = 7
        student2.projectPoints = 26
        
        let student3 = Student(context: context)
        student3.name = "Endrit Shaqiri"
        student3.firstCourseAttendance = 5
        student3.secondCourseAttendance = 4
        student3.projectPoints = 22
        
        professor.addToStudents(NSSet(array: [student3, student2, student1, student]))

        
        //save
        do{
            try context.save()
        } catch{
            //error
        }
        
    }
    
    
}
