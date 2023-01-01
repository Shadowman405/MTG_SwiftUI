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
    
    var body: some View {
        List(collections, id: \.id){ collection in
                Text(collection.collectionName)
        }

    }
}

struct SaveInCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        SaveInCollectionView()
    }
}
