//
//  ContentView.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 25.12.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("mtg_green")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .border(Color.orange)
                    .clipped()
                VStack {
                    Text("Cards")
                        .foregroundColor(.orange)
                        .padding()
                    Text("My Collections")
                        .foregroundColor(.orange)
                        .padding()
                    Text("Health Counter")
                        .foregroundColor(.orange)
                        .padding()
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
