//
//  ViewController.swift
//  FIEK Portal
//
//  Created by Fisnik on 17/09/2022.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var professorItems:[Professor]?
    
    let customAlert = InfoAlert()
    let dbHelper = DatabaseHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Check if there's records in the device, if not -> fill the database
        let emptyDb = dbHelper.professorEntityIsEmpty()
        
        if(emptyDb == true){
            dbHelper.fillDatabase()
        }
    }

    
    @IBAction func didTapLogin(_ sender: UIButton) {
        professorItems = dbHelper.fetchProfessor(username: usernameField.text!, password: passwordField.text!)
        
    
        
        if((professorItems?.count)! > 0) {
            let vc = storyboard?.instantiateViewController(identifier: "tabBarController") as! UITabBarController
            
            let homeNavVc = vc.viewControllers![1] as! UINavigationController
            let homeVc = homeNavVc.topViewController as! HomeViewController
            homeVc.activeProfessor = professorItems![0]
            
            let bonusNavVc = vc.viewControllers![2] as! UINavigationController
            let bonusVc = bonusNavVc.topViewController as! BonusViewController
            bonusVc.activeProfessor = professorItems![0]
            
            vc.modalPresentationStyle = .fullScreen
            
            present(vc, animated: true)
        } else {
            usernameField.text! = ""
            passwordField.text! = ""
            
            customAlert.showAlert(with: "Wrong credentials!", message: "We could not find a user with such credentials!\nPlease, try again!", on: self)
        }
    }
    
    
    @objc func dismissAlert(){
        customAlert.dismissAlert()
    }
    
    

}

