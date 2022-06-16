//
//  AddViewController.swift
//  Day4
//
//  Created by Evan N on 16/06/22.
//

import UIKit

class DisplayViewController: UIViewController {
    let userDefaults = UserDefaults()
    @IBOutlet var tableView: UITableView!
    var notes: [Note] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = UserDefaults.standard.value(forKey:"notes") as? Data {

                    let decodedNotes = try? PropertyListDecoder().decode([Note].self, from: data)

                    notes = decodedNotes ?? []

                }
        
        tableView.reloadData()
        self.title = "To Do List"
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        // Do any additional setup after loading the view.
    }
}

extension DisplayViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title = notes[indexPath.row].title
        let subtitle = notes[indexPath.row].subtitle
        
        
      //  print(image)
         let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        cell.titleLabel.text = title
        cell.subtitleLabel.text = subtitle
        cell.configure(with: indexPath.row)
        cell.delegate = self
 
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me!")
    }
    
 // Do Something Here Later
}

extension DisplayViewController: CustomTableViewCellDelegate{
    func didTapButton(with id: Int) {
        if let data = UserDefaults.standard.value(forKey:"notes") as? Data {

                    let decodedNotes = try? PropertyListDecoder().decode([Note].self, from: data)

                    notes = decodedNotes ?? []

                }
        
        notes.remove(at: id)
        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(notes), forKey: "notes")
        tableView.reloadData()
    }
    
    
}
