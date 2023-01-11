//
//  Storage Network.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 25.12.22.
//

import Foundation
import RealmSwift

class StorageManager: ObservableObject {
    static let shared = StorageManager()
    
    let realm = try! Realm()
    
    init() {}
    
    //MARK: - Save/delete collection
//    func save(cardCollection: [CardCollection]) {
//        write {
//            realm.add(cardCollection)
//        }
//    }
//    
//    func save(cardCollection: CardCollection) {
//        write {
//            realm.add(cardCollection)
//        }
//    }
//    
//    func delete(cardCollection: CardCollection) {
//        write {
//            realm.delete(cardCollection.cards)
//            realm.delete(cardCollection)
//        }
//    }
//    
//    //MARK: - Save CArd
//    
//    func save(card: CardMTG,in cardCollection: CardCollection){
//        write {
//            cardCollection.cards.append(card)
//        }
//    }
    
    
    private func write(_ completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
