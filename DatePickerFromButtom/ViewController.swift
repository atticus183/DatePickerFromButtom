//
//  ViewController.swift
//  DatePickerFromButtom
//
//  Created by Josh R on 3/23/19. JRR
//  Copyright © 2019 Josh R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var customDatePickerView: DatePickerView = {
        let pickerView = DatePickerView()
        return pickerView
    }()
    
    var selectedDate: Date?
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var pickDateBtnOutlet: UIButton!
    @IBAction func pickDateBtn(_ sender: UIButton) {
        customDatePickerView.showDatePicker()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickDateBtnOutlet.layer.cornerRadius = pickDateBtnOutlet.layer.frame.height / 2
        
        customDatePickerView.passDate = { [weak self] date in
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            
            let dateString = dateFormatter.string(from: date)
            self?.dateLbl.text = dateString
            self?.selectedDate = date
        }
    }
    
}

