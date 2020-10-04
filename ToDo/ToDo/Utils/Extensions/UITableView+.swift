//
//  UITableView+.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_ cellType: T.Type, reuseIdentifier: String? = nil) {
        let identifier = reuseIdentifier ?? cellType.reuseIdentifier
        
        if cellType == UITableViewCell.self {
            self.register(cellType.classForCoder(), forCellReuseIdentifier: identifier)
        } else {
            self.register(cellType.nib, forCellReuseIdentifier: identifier)
        }
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self, reuseIdentifier: String? = nil) -> T {
        let cell = self.dequeueReusableCell(withIdentifier: reuseIdentifier ?? cellType.reuseIdentifier, for: indexPath) as! T
        return cell
    }
}

extension UITableViewCell: Reusable {

}
