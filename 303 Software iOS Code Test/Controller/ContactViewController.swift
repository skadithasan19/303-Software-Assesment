//
//  ContactViewController.swift
//  303 Software iOS Code Test
//
//  Created by Hasan, Adit on 4/10/19.
//  Copyright © 2019 Hasan, Adit. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var tabDatasource:CTableViewSource<Contact>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "http://www.filltext.com/?rows=100&fname=%7BfirstName%7D&lname=%7BlastName%7D&city=%7Bcity%7D&pretty=true"
        
        self.title = "Contacts"
        APICall.GetContacts { (contacts) in
            if let contactsArray = contacts {
                self.tabDatasource = CTableViewSource.make(contacts: contactsArray, identifier: "cell")
                self.tableView.dataSource = self.tabDatasource
                self.tableView.reloadData()
            }
        }

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
