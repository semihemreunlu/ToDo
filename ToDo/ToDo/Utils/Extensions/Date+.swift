//
//  Date+.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import Foundation

extension Date {
    func toString(format: String = "dd/MM/yyyy - HH:mm",
                  locale: Locale = .current) -> String {
        let dateFormatter = DateFormatter(format: format)
        dateFormatter.locale = locale
        return dateFormatter.string(from: self)
    }
}

extension DateFormatter {
    convenience init (format: String) {
        self.init()
        
        dateFormat = format
        locale = Locale.current
    }
}
