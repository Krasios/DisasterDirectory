//
//  ClaimsItem.swift
//  DisasterDirectory
//
//  Created by Sreelakshmi Kariyadan on 1/13/18.
//  Copyright © 2018 fireCampers. All rights reserved.
//

import Foundation

class ClaimsItem{
    var type : String
    var img : String //url link
    var cost : String
    init(type:String,img: String,cost: Int = 0){
        self.type = type
        self.img = img
        self.cost = "\(cost)"
    }
}
