//
//  DifferenceData.swift
//  myBank
//
//  Created by 山根大生 on 2020/09/15.
//  Copyright © 2020 taisei. All rights reserved.
//

import UIKit
import RealmSwift

class DifferenceData: Object {
    @objc dynamic var date: Date = Date()
    @objc dynamic var difference: Int = 0
    @objc dynamic var contents: String = ""
}
