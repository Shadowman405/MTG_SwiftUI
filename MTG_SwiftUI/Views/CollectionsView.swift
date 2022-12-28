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
    var collections = StorageManager.shared.realm.objects(CardCollection.self)
    
    var body: some View {
        ForEach(collections){ collection in
            Text(collection.collectionName)
        }
    }
}

struct CollectionsView_Previews: PreviewProvider {
    static var previews: some View {
        
        CollectionsView()
            .environmentObject(StorageManager())
    }
}
