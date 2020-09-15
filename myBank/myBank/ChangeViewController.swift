//
//  ChangeViewController.swift
//  myBank
//
//  Created by 山根大生 on 2020/09/14.
//  Copyright © 2020 taisei. All rights reserved.
//

import UIKit
import RealmSwift

class ChangeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var incomeOrSpend: UISegmentedControl!
    @IBOutlet weak var moneyLabel: UITextField!
    @IBOutlet weak var contentsLabel: UITextField!
    
    public var completionHandoler: (() -> Void)?
    
    let realm = try! Realm()
    
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

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }

    
    @IBAction func confirmBtn(_ sender: Any) {
        print("tap")
        
        if let money = moneyLabel.text, !money.isEmpty {
            let contents = contentsLabel.text
            
            realm.beginWrite()
            let newItem = DifferenceData()
            newItem.difference = Int(money)!
            newItem.contents = contents ?? ""
            newItem.date = Date()
            realm.add(newItem)
            try! realm.commitWrite()
            
            completionHandoler?()
            
            navigationController?.popToRootViewController(animated: true)
        }

    }
}
