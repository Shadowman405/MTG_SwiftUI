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
    var card: CardMTGUI
    
    var body: some View {
        List(collections, id: \.id){ collection in
            HStack {
                Text(collection.collectionName)
                
                Spacer()
                
                Button {
                    saveCard(collection: collection, card: card)
                    print(collection.collectionName)
                    print(card.name)
                    
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
        }

    }
    
    func saveCard(collection: CardCollectionUI, card: CardMTGUI) {
        let realm = collection.realm!.thaw()
        let thawedCollection = collection.thaw()!
        try! realm.write {
            thawedCollection.cards.append(card)
        }
    }
}

struct SaveInCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        SaveInCollectionView(card: CardMTGUI())
    }
}
