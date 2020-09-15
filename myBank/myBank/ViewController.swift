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
    private var total = TotalMoney()
    private var diffData = [DifferenceData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(total.total)
        diffData = realm.objects(DifferenceData.self).map({ $0 })
        
        tableView.rowHeight = 150
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "DifferenceCell", bundle: nil), forCellReuseIdentifier: "DifferenceCell")
        
        refresh()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diffData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DifferenceCell", for: indexPath) as! DifferenceCell
//        cell.dataHand(station: Station(date: Date(), difference: 300000, contents: "Mac"))
        return cell
    }
    
    func refresh() {
        diffData = realm.objects(DifferenceData.self).map({ $0 })
        tableView.reloadData()
    }

}

