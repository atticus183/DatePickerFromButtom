//
//  ViewController.swift
//  DatePickerFromButtom
//
//  Created by Josh R on 3/23/19. JRR
//  Copyright © 2019 Josh R. All rights reserved.
//

import UIKit

class DateVC: UIViewController {
    
    lazy var customDatePickerView: DatePickerView = {
        let pickerView = DatePickerView()
        return pickerView
    }()
    
    var selectedDate: Date? {
        didSet {
            dateLbl.text = selectedDate?.formatDateLong()
        }
    }
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var pickDateBtnOutlet: UIButton!
    @IBAction func pickDateBtn(_ sender: UIButton) {
        customDatePickerView.showDatePicker()
        
        customDatePickerView.passDate = { [weak self] date in
            self?.selectedDate = date
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Round btn corners
        pickDateBtnOutlet.layer.cornerRadius = pickDateBtnOutlet.layer.frame.height / 2
        
    }
    
}

