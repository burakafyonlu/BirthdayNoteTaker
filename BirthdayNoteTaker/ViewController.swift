//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Burak Afyonlu on 9.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var birthdayText: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "1")
            let storedBirthday = UserDefaults.standard.object(forKey: "2")
                if let newName = storedName as? String {
                    nameLabel.text = newName
        }
                    if let newBirthday = storedBirthday as? String {
                        birthdayLabel.text = newBirthday
        }
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func hideKeyboard() {
        
        view.endEditing(true)
        
    }

    @IBAction func saveClicked(_ sender: Any) {
        
        nameLabel.text = nameText.text
            birthdayLabel.text = birthdayText.text
        
        UserDefaults.standard.set(nameText.text!, forKey: "1")
            UserDefaults.standard.set(birthdayText.text!, forKey: "2")
        
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "1")
            let storedBirthday = UserDefaults.standard.object(forKey: "2")
        
                if (storedName as? String) != nil {
                    UserDefaults.standard.removeObject(forKey: "1")
        }
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "2")
        }
    }
}

