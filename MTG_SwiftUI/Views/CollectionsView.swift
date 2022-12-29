//
//  CollectionsView.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 29.12.22.
//

import SwiftUI
import RealmSwift

struct CollectionsView: View {
    @EnvironmentObject var dataManager: StorageManager
    @ObservedRealmObject var collections: CardCollectionUI
    
    var body: some View {
        NavigationView {
            List{
                ForEach(collections.cards) { collection in
                    Text(collection.name)
                }
                .onMove(perform: $collections.cards.move)
                .onDelete(perform: $collections.cards.remove)
            }
        }
    }
}

struct CollectionsView_Previews: PreviewProvider {
    static var previews: some View {
        
        CollectionsView(collections: CardCollectionUI())
            .environmentObject(StorageManager())
    }
}
