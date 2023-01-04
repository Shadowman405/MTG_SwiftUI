//
//  CardsInCollectionView.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 31.12.22.
//

import SwiftUI
import RealmSwift

struct CardsInCollectionView: View {
    
    @ObservedRealmObject var collection: CardCollectionUI
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(collection.cards){ card in
                    Section(header: Text("Main Deck")) {
                        HStack {
                                Text(card.name)
                                NavigationLink(destination: CardDetailsFromCollection(card: card)) {
                                    Text("")
                                }
                        }
                    }
                }
                .onMove(perform: $collection.cards.move)
                .onDelete(perform: $collection.cards.remove)
            }
            .navigationBarTitle("Cards in " + collection.collectionName + " collection", displayMode: .inline)
            //.navigationBarBackButtonHidden(false)
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct CardsInCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CardsInCollectionView(collection: CardCollectionUI())
    }
}
