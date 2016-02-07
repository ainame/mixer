//
//  RealmStore.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/07.
//  Copyright © 2016年 ainame. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmStore {
    typealias ResultType: Object
    func getRealm() -> Realm
    func allObjects() -> Results<ResultType>
    func add(object: ResultType)
    func findById(_: String) -> ResultType
}

extension RealmStore {
    func getRealm() -> Realm {
        let realm = try! Realm()
        return realm
    }

    func allObjects() -> Results<ResultType> {
        return getRealm().objects(ResultType)
    }
    
    func add(object: ResultType) {
        let realm = getRealm()
        try! realm.write { realm.add(object) }
    }
    
    func findById(id: String) -> ResultType {
        let realm = getRealm()
        return realm.objects(ResultType).filter(NSPredicate(format: "id = %@", id)).first!
    }
}