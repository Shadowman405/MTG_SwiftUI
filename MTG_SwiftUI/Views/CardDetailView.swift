//
//  CardDetailView.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 27.12.22.
//

import SwiftUI

struct CardDetailView: View {
    @EnvironmentObject var dataManager: NetworkManager
    var card: CardMTG
    
    var body: some View {
        VStack {
            Text(card.name)
                .padding()
            
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
            
            Text("Set name: " + card.setName)
            Text("Card rarity: " + card.rarity)
            Text("Mana Cost: " + card.manaCost)
            Text("Description")
            Text(card.text)
            
        }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let cardOne = CardMTG()
        
        CardDetailView(card: cardOne)
            .environmentObject(NetworkManager())
    }
}
