//
//  Extensions.swift
//  DatePickerFromButtom
//
//  Created by Josh R on 5/28/19.
//  Copyright © 2019 Josh R. All rights reserved.
//

import Foundation

extension Date {
    func formatDateLong() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}
