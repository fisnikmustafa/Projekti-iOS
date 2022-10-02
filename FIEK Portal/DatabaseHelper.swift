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
    
    
    func createBonusItem(student: Student, course: String, value: Int64, customAlert: InfoAlert, viewController: UIViewController){
        let newItem = Bonus(context: context)
        newItem.student = student
        newItem.course = course
        newItem.value = value
        
        do{
            try context.save()
        } catch{
            customAlert.showAlert(with: "Could not add the item!", message: "Make sure you type an existing student and an existing course!\nPlease, try again!", on: viewController)
        }
        
    }
    
    func deleteBonusItem(item: Bonus){
        context.delete(item)
        
        do{
            try context.save()
        } catch{
            //error
        }
    }
    
    func updateBonusItem(item: Bonus, newStudent: Student, newCourse: String, newValue: Int64){
        item.student = newStudent
        item.course = newCourse
        item.value = newValue
        
        do{
            try context.save()
        } catch{
            //error
        }
    }
    
    
    
    func clearDatabase(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        let fetchRequest1 = NSFetchRequest<NSFetchRequestResult>(entityName: "Professor")

        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        let batchDeleteRequest1 = NSBatchDeleteRequest(fetchRequest: fetchRequest1)

        do {
            try context.execute(batchDeleteRequest)
            try context.execute(batchDeleteRequest1)
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
