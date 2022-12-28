//
//  Collection.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 25.12.22.
//

import Foundation
import RealmSwift


class CardCollection: Object, Identifiable {
    @objc dynamic var collectionName = ""
    let cards = List<CardMTG>()
}
