//
//  Card.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 25.12.22.
//

import Foundation
import RealmSwift

class CardMTG: Object, Codable, ObjectKeyIdentifiable {
    @objc dynamic var name: String
//    let cmc: Int
//    let colorIdentity: [String]
    @objc dynamic var type: String
    @objc dynamic var rarity: String
    @objc dynamic var setName: String
    @objc dynamic var imageURL: String
    @objc dynamic var manaCost: String
    @objc dynamic var text: String
//    let foreignNames: [ForeignName]
//    let printings: [String]
    @objc dynamic var originalType: String
//    let legalities: [LegalityElement]
    @objc dynamic var id: String
    
    
    convenience init?(cardData: [String: Any]) {
        self.init()
        
        name = cardData["name"] as? String ?? ""
        type = cardData["type"] as? String ?? ""
        imageURL = cardData["imageUrl"] as? String ?? ""
        originalType = cardData["originalType"] as? String ?? ""
        id = cardData["id"] as? String ?? ""
        rarity = cardData["rarity"] as? String ?? ""
        manaCost = cardData["manaCost"] as? String ?? ""
        setName = cardData["setName"] as? String ?? ""
        text = cardData["text"] as? String ?? ""
    }
    
    
    
    static func getAllCards(from value: Any) -> [CardMTG]? {
        guard let value = value as? [String: Any] else { return []}
        guard let results = value["cards"] as? [[String: Any]] else {return []}
        return results.compactMap { CardMTG(cardData: $0) }
    }
}

final class CardMTGUI: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String = ""
    @Persisted var type: String
    @Persisted var rarity: String
    @Persisted var setName: String
    @Persisted var imageURL: String
    @Persisted var manaCost: String
    @Persisted var text: String
//    let foreignNames: [ForeignName]
//    let printings: [String]
    @Persisted var originalType: String
//    let legalities: [LegalityElement]
    //@Persisted var id: String
    
    @Persisted(originProperty: "cards") var group: LinkingObjects<CardCollectionUI>
}
