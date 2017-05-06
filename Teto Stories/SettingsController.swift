//
//  OtherControllers.swift
//  TetoFeed
//
//  Created by Fernando Augusto de Marins on 14/04/17.
//  Copyright © 2017 Fernando Augusto de Marins. All rights reserved.
//

import UIKit
import Firebase

class SettingsController: UITableViewController {
    
    static let cellId = "cellId"
    
    let settingsArray = ["Logout", "Termos de uso", "Sobre"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Settings"
        
        tableView.separatorColor = UIColor.rgb(229, green: 231, blue: 235, alpha: 1)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: SettingsController.cellId)

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: SettingsController.cellId, for: indexPath) 
        
        cell.textLabel?.text = settingsArray[indexPath.row]
        cell.imageView?.backgroundColor = UIColor.black
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedCell = tableView.cellForRow(at: indexPath)
        
        if selectedCell?.textLabel?.text == "Logout" {
            try! FIRAuth.auth()!.signOut()
            dismiss(animated: true, completion: nil)
        }
    }

}
