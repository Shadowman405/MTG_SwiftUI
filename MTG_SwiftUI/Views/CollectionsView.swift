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
    @State private var presentAlert = false
    @State private var collectionName = ""
    @ObservedResults(CardCollectionUI.self) var collections
    
    var body: some View {
        NavigationView {
            List(collections, id: \.id){ collection in
                ZStack {
                    HStack {
                        Text(collection.collectionName)
                        Spacer()
                        Text("60/\(collection.cards.count)")
                    }
                    NavigationLink(destination: CardsInCollectionView(collection: collection)) {
                        Text("")
                    }
                    .opacity(0)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Collections", displayMode: .large)
        //.navigationBarBackButtonHidden(false)
        .navigationBarItems(trailing: EditButton())
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    presentAlert = true
                    //$collections.append(CardCollectionUI())
                }
            label: {
                    Image(systemName: "plus")
                }
            .alert("Add", isPresented: $presentAlert) {
                TextField("Collection Name", text: $collectionName)
                
                Button("Add", action: {
                    var collName = CardCollectionUI(value: [$collectionName.wrappedValue])
                    $collections.append(collName)
                })
                Button("Cancel", role: .cancel, action: {})
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
