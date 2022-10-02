//
//  BonusViewController.swift
//  FIEK Portal
//
//  Created by Fisnik on 25/09/2022.
//

import UIKit

class BonusTableCell: UITableViewCell{
    
    @IBOutlet weak var containerView: UIView!
    
    let dbHelper = DatabaseHelper()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        applyShadow(cornerRadius: 8)
        self.containerView.layer.cornerRadius = 8
        self.containerView.layer.masksToBounds = true
    }
}

class BonusViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bonusCell", for: indexPath)
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didTapLogin(_ sender: UIBarButtonItem) {
        
        let customAlert = InfoAlert()
        let alert = UIAlertController(title: "New item",
                                      message: "Enter new item",
                                      preferredStyle: .alert)
        
        
        
        alert.addTextField {field in
            field.placeholder = "Emri"
        }
        
        alert.addTextField {field in
            field.placeholder = "Lenda"
        }
        
        alert.addTextField {field in
            field.placeholder = "Piket (1-10)"
        }
        
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: { _ in
            guard let nameField = alert.textFields?[0], let name = nameField.text, !name.isEmpty else{
                customAlert.showAlert(with: "Invalid entry!", message: "You must specify a student name!\nPlease, try again!", on: self)
                return
            }
            
            
            guard let courseField = alert.textFields?[1], let course = courseField.text, !course.isEmpty else{
                customAlert.showAlert(with: "Invalid entry!", message: "You must specify a course name!\nPlease, try again!", on: self)
                return
            }
            
            guard let gradeField = alert.textFields?[2], let grade = gradeField.text, !grade.isEmpty, grade.isNumber, Int(grade)! > 0, Int(grade)! < 11  else {
                customAlert.showAlert(with: "Invalid entry!", message: "You must specify the amount of bonus points (1-10) for the student!\nPlease, try again!", on: self)
                return
            }
            

        }))
        
        present(alert, animated: true)
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
