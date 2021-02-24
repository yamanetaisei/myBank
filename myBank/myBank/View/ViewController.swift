//
//  ViewController.swift
//  myBank
//
//  Created by 山根大生 on 2020/09/14.
//  Copyright © 2020 taisei. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private let realm = try! Realm()

    private var diffData = [DifferenceData]()
    
    let diffCell = DifferenceCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "#3a4660")
        
        totalLabel.text = String(getTotal())
        diffData = realm.objects(DifferenceData.self).map({ $0 })
        
        totalLabel.textColor = .white
        
        tableView.rowHeight = 150
        tableView.backgroundColor = UIColor(hex: "#3a4660")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "DifferenceCell", bundle: nil), forCellReuseIdentifier: "DifferenceCell")
        
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: "#3a4660")
        
        self.navigationController?.navigationBar.tintColor = .yellow
        
        upd()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diffData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DifferenceCell", for: indexPath) as! DifferenceCell
        let count = diffData.count - indexPath.row - 1
        cell.dataHand(station: Station(date: Date(), difference: diffData[count].difference, contents: diffData[count].contents, checker: diffData[count].addOrSubtraction ))
        cell.backgroundColor = UIColor(hex: "#3a4660")
        return cell
    }
    
    func upd() {
        diffData = realm.objects(DifferenceData.self).map({ $0 })
        tableView.reloadData()
        totalLabel.text = String(getTotal())
    }
    @IBAction func changeBtn(_ sender: Any) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "change") as? ChangeViewController else {
            return
        }
        
        vc.completionHandoler = { [weak self] in
            self?.upd()
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func getTotal() -> Int {
        
        var total = 0
        
        for num in 0..<diffData.count {
            
            if diffData[num].addOrSubtraction == true{
                total += diffData[num].difference
            }else if diffData[num].addOrSubtraction == false{
                total -= diffData[num].difference
            }
        }
        
        return total
    }
}

