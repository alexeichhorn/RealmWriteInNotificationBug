//
//  RealmModels.swift
//  RealmWriteInNotification
//
//  Created by Alexander Eichhorn on 05.03.21.
//

import Foundation
import RealmSwift

class Sample: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var text = ""
    
    override class func primaryKey() -> String? {
        "id"
    }
}
