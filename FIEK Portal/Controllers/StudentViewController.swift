//
//  StudentViewController.swift
//  FIEK Portal
//
//  Created by Fisnik on 21/09/2022.
//

import UIKit

class StudentViewController: UIViewController, UITableViewDataSource,  UITableViewDelegate {

    let dbHelper = DatabaseHelper()
    var studentItems: [Student]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentItems = dbHelper.fetchStudents()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (studentItems?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let student = studentItems![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCellId", for: indexPath) as! StudentListTableViewCell
        
        cell.nameLabel.text = student.name
        cell.firstClassLabel.text = String(student.firstCourseAttendance)
        cell.secondClassLabel.text = String(student.secondCourseAttendance)
        cell.projectLabel.text = String(student.projectPoints)
        
        return cell
    }
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
