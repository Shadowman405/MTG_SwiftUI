//
//  SaveInCollectionView.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 1.01.23.
//

import SwiftUI
import RealmSwift

struct SaveInCollectionView: View {
    @ObservedResults(CardCollectionUI.self) var collections
    //@ObservedResults(CardMTGUI.self) var card
    @ObservedRealmObject var card: CardMTGUI
    @ObservedRealmObject var collToSave: CardCollectionUI
    @Environment(\.realm) var realm
    
    var body: some View {
        List(collections, id: \.id){ collection in
            HStack {
                Text(collection.collectionName)
                
                Spacer()
                
                Button {
                    $collToSave.cards.append(card)
                    print(collection.collectionName)
                    print(card.name)
                    
                    
//                    try? realm.write {
//                        realm.add(collection.cards.append(card))
//                    }
                } label: {
                    Image(systemName: "plus")
                }

            }
        }

    }
}

struct SaveInCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        SaveInCollectionView(card: CardMTGUI(), collToSave: CardCollectionUI())
    }
}
