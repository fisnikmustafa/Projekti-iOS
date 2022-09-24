//
//  ProfileViewController.swift
//  FIEK Portal
//
//  Created by Fisnik on 24/09/2022.
//

import UIKit

class HomeViewController: UIViewController {

    var activeProfessor: Professor?
    
    @IBOutlet weak var professorName: UILabel!
    @IBOutlet weak var firstCourse: UILabel!
    @IBOutlet weak var secondCourse: UILabel!
    @IBOutlet weak var numberOfStudents: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        professorName.text = (activeProfessor?.name)!
        firstCourse.text = "1. " + (activeProfessor?.firstCourse)!
        secondCourse.text = "2. " + (activeProfessor?.secondCourse)!
        numberOfStudents.text = String((activeProfessor?.students?.count)!)
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
