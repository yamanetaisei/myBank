//
//  ChangeViewController.swift
//  myBank
//
//  Created by 山根大生 on 2020/09/14.
//  Copyright © 2020 taisei. All rights reserved.
//

import UIKit

class ChangeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var incomeOrSpend: UISegmentedControl!
    @IBOutlet weak var moneyLabel: UITextField!
    @IBOutlet weak var contentsLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moneyLabel.delegate = self
        moneyLabel.keyboardType = UIKeyboardType.numberPad
        
        contentsLabel.delegate = self
        
        incomeOrSpendSetup()
    }
    
    func incomeOrSpendSetup() {
        incomeOrSpend.setTitle("収入", forSegmentAt: 0)
        incomeOrSpend.setTitle("支出", forSegmentAt: 1)
    }

    

}
