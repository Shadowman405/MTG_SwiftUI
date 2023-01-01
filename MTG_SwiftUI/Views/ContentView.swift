//
//  ContentView.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 25.12.22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("mtg_green")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
//                NavigationView {
//                    List(storageManager.categories, id: \.id){
//                        category in
//                        Text(category.name)
//                    }
//                }
                VStack {
                    // To Cards
                    NavigationLink {
                        CardsView()
                    } label: {
                        Text("Cards")
                            .foregroundColor(.orange)
                    }
                    .padding()
                    // To collections
                    NavigationLink {
                        CollectionsView()
                    } label: {
                        Text("Collections")
                            .foregroundColor(.orange)
                    }
                    .padding()
                    // To HP Counter
                    NavigationLink {
                        CardsView()
                    } label: {
                        Text("Health Counter")
                            .foregroundColor(.orange)
                    }
                    .padding()
                }
            }
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


