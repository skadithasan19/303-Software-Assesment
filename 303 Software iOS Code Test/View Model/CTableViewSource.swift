//
//  CTableViewSource.swift
//  303 Software iOS Code Test
//
//  Created by Hasan, Adit on 4/10/19.
//  Copyright © 2019 Hasan, Adit. All rights reserved.
//

import UIKit

class CTableViewSource<Model>: NSObject, UITableViewDataSource , UITableViewDelegate {
    
    typealias CellConfigurator = (Model, UITableViewCell) -> Void
    
    typealias CellSelectorConfigurator = (Model, IndexPath) -> Void
 
    var model: [Model]
    
    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator
    private let cellSelectConfigurator: CellSelectorConfigurator
    
    init(models: [Model],
         reuseIdentifier: String,
         cellConfigurator: @escaping CellConfigurator,
         selector cellSelectConfigurator: @escaping CellSelectorConfigurator) {
        self.model = models
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
        self.cellSelectConfigurator = cellSelectConfigurator
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath
        )
        
        cellConfigurator(model[indexPath.row], cell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellSelectConfigurator(model[indexPath.row], indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


extension CTableViewSource where Model == Contact {
    
    static func make(contacts:[Contact], identifier:String) -> CTableViewSource {
    
        return CTableViewSource(models: contacts, reuseIdentifier: identifier, cellConfigurator: { (contact, defaultCell) in
            if let cell = defaultCell as? ContactCell {
                cell.nameLabel.text = "\(contact.fname ?? "") \(contact.lname ?? "")"
                cell.cityLabel.text = contact.city
            }
        }, selector: { (contact, indexpath) in
            /// do something we select a cell
        })
    }
    
}
