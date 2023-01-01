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
                    Text(card.name)
                }
                .onMove(perform: $collection.cards.move)
                .onDelete(perform: $collection.cards.remove)
            }
            .navigationBarTitle("Cards in " + collection.collectionName, displayMode: .large)
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
