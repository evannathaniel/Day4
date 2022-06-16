//
//  ViewController.swift
//  Day4
//
//  Created by Evan N on 16/06/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var notes: [Note] = []
    var bool: Bool = false
    @IBOutlet var titleField: UITextField!
    @IBOutlet var subtitleField: UITextField!
    @IBOutlet var descriptionText: UITextView!
    
    
    @IBAction func submitButton(_ sender: Any) {
        if bool{
            if let data = UserDefaults.standard.value(forKey:"notes") as? Data {

                        let decodedNotes = try? PropertyListDecoder().decode([Note].self, from: data)

                        notes = decodedNotes ?? []

                    }
            
            notes.append(Note(title: titleField.text ?? "", subtitle: subtitleField.text ?? "", description: descriptionText.text ?? ""))
            
            UserDefaults.standard.set(try? PropertyListEncoder().encode(notes), forKey: "notes")
            showGoodAlert()
            
        }else{
            showBadAlert()
        }
        
    }
    
    func showBadAlert() {
        let alert = UIAlertController(title: "Caution", message: "The title or subtitle are still empty", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {action in
            
        }))
        
        present(alert, animated: true)
        
    }
    func showGoodAlert() {
        let alert = UIAlertController(title: "Success", message: "New notes added to ToDo List", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {action in
            let displayVc =  UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "DisplayViewController")

                        self.navigationController?.pushViewController(displayVc, animated: true)
        }))
        
        present(alert, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleField.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: .editingChanged)
            subtitleField.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
            if titleField.text == "" || subtitleField.text == ""{
                bool = false
            }else{
                bool = true
            }
    }

}

