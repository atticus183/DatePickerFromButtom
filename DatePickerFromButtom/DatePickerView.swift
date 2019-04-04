//
//  DatePickerView.swift
//  DatePickerFromButtom
//
//  Created by Josh R on 3/23/19.
//  Copyright © 2019 Josh R. All rights reserved.
//

import UIKit

class DatePickerView: UIView {
    
    var passDate:((Date) -> Void)?
    
    lazy var doneBtn: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        button.backgroundColor = .clear
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Done", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(doneTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var todayBtn: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        button.backgroundColor = .clear
        button.setTitleColor(.purple, for: .normal)
        button.setTitle("Today", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(todayTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.calendar = .current
        picker.datePickerMode = .dateAndTime
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.backgroundColor = .white
        return picker
    }()
    
    lazy var blurredBackGround: UIView = {
        let blurredBackground = UIView()
        
        return blurredBackground
    }()
    
    func showDatePicker() {
        if let window = UIApplication.shared.keyWindow {
            blurredBackGround.backgroundColor = UIColor(white: 0, alpha: 0.8)
            let gestureRecog = UITapGestureRecognizer(target: self, action: #selector(handleDismiss))
            blurredBackGround.addGestureRecognizer(gestureRecog)
            
            window.addSubview(blurredBackGround)
            window.addSubview(self)
            
            let height: CGFloat = 300
            let y = window.frame.height - height
            self.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            blurredBackGround.frame = window.frame
            blurredBackGround.alpha = 0
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                self.blurredBackGround.alpha = 1
                
                self.frame = CGRect(x: 0, y: y, width: self.frame.width, height: self.frame.height)
            }, completion: nil)
        }
    }
    
    @objc func doneTapped() {
        passDate?(datePicker.date)
        
        UIView.animate(withDuration: 0.3) {
            self.blurredBackGround.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.frame = CGRect(x: 0, y: window.frame.height, width: self.frame.width, height: self.frame.height)
            }
        }
    }
    
    @objc func todayTapped() {
        datePicker.date = Date()
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.3) {
            self.blurredBackGround.alpha = 0.0
            
            if let window = UIApplication.shared.keyWindow {
                self.frame = CGRect(x: 0, y: window.frame.height, width: self.frame.width, height: self.frame.height)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        
        self.addSubview(blurredBackGround)
        self.addSubview(doneBtn)
        self.addSubview(todayBtn)
        self.addSubview(datePicker)
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupConstraints() {
        doneBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        doneBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        doneBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        doneBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        todayBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        todayBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        todayBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        todayBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        datePicker.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        datePicker.topAnchor.constraint(equalTo: doneBtn.bottomAnchor, constant: 0).isActive = true
        datePicker.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
}
