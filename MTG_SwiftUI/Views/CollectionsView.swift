//
//  CollectionsView.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 29.12.22.
//

import SwiftUI
import RealmSwift

struct CollectionsView: View {
    //@EnvironmentObject var dataManager: StorageManager
    @ObservedResults(CardCollectionUI.self) var collections
    
    var body: some View {
        NavigationView {
            List(collections, id: \.id){ collection in
                Text(collection.collectionName)
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Collections", displayMode: .large)
        .navigationBarBackButtonHidden(false)
        .navigationBarItems(trailing: EditButton())
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    $collections.append(CardCollectionUI())
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
    }
}

struct CollectionsView_Previews: PreviewProvider {
    static var previews: some View {
        
        CollectionsView()
    }
}
