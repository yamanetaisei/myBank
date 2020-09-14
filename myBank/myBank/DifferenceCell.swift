//
//  DifferenceCell.swift
//  myBank
//
//  Created by 山根大生 on 2020/09/14.
//  Copyright © 2020 taisei. All rights reserved.
//

import UIKit

class DifferenceCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var differenceLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func dateToString(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
    
    func dataHand(station: Station){
        self.dateLabel.text = dateToString(date: station.date)
        self.differenceLabel.text = String(station.difference)
        self.contentsLabel.text = station.contents
    }
    
}

class Station: NSObject {
    var date: Date
    var difference: Int
    var contents: String
    
    init(date: Date, difference: Int, contents: String ) {
        self.date = date
        self.difference = difference
        self.contents = contents
    }
}
