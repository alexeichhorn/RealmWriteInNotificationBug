//
//  ViewController.swift
//  RealmWriteInNotification
//
//  Created by Alexander Eichhorn on 05.03.21.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    let realm = try! Realm()
    
    var token: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        token = realm.objects(Sample.self).observe { [unowned self] change in
            switch change {
            case .initial(let items):
                print("items: \(items.count)")
                for i in 0..<100 {
                    print(i)
                    writeRandomStuff()
                }
                
            default: break
            }
        }
    }
    
    private func writeRandomStuff() {
        
        let differentRealm = try! Realm()
        
        if differentRealm.isInWriteTransaction { fatalError() }
        
        let newItem = Sample()
        newItem.id = Int.random(in: 0..<1000000000)
        newItem.text = "text for \(newItem.id)"
        
        try? differentRealm.write {
            differentRealm.add(newItem)
        }
        
    }


}

