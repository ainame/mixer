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
    func createOrUpdate(object: ResultType)
    func findById(_: String) -> ResultType
    func delete(object: ResultType)
    func deleteAll()
}

extension RealmStore {
    func getRealm() -> Realm {
        let realm = try! Realm()
        return realm
    }

    func allObjects() -> Results<ResultType> {
        return getRealm().objects(ResultType)
    }
    
    func createOrUpdate(object: ResultType) {
        let realm = getRealm()
        try! realm.write { realm.add(object, update: true) }
    }
    
    func findById(id: String) -> ResultType {
        let realm = getRealm()
        return realm.objects(ResultType).filter(NSPredicate(format: "id = %@", id)).first!
    }
    
    func delete(object: ResultType) {
        let realm = getRealm()
        try! realm.write { realm.delete(object) }
    }
    
    func deleteAll() {
        let realm = getRealm()
        try! realm.write {
            var array = [ResultType]()
            realm.objects(ResultType).forEach { array.append($0) }
            realm.delete(array)
        }
    }
}