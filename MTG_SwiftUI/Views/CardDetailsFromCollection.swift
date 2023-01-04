//
//  CardDetailsFromCollection.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 4.01.23.
//

import SwiftUI

struct CardDetailsFromCollection: View {
    @EnvironmentObject var dataManager: NetworkManager
    var card: CardMTGUI
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: card.imageURL), transaction: Transaction(animation: .easeInOut)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .frame(width: 240 , height: 330)
                } else {
                    Image("mr224_back")
                        .resizable()
                        .frame(width: 240, height: 330)
                }
            }
            
            Spacer()
            
            Text("Set name: " + card.setName)
            Text("Card rarity: " + card.rarity)
            Text("Mana Cost: " + card.manaCost)
            Text("Description")
            Text(card.text)
            
        }
        .navigationTitle(card.name)
    }
}

struct CardDetailsFromCollection_Previews: PreviewProvider {
    static var previews: some View {
        let cardOne = CardMTGUI()
        
        CardDetailsFromCollection(card: cardOne)
            .environmentObject(NetworkManager())
    }
}
