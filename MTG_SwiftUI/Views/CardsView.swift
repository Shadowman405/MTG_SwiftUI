//
//  CardsView.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 25.12.22.
//

import SwiftUI

struct CardsView: View {
    @EnvironmentObject var dataManager: NetworkManager
    
    var body: some View {
        List(dataManager.cards, id: \.id) { card in
            HStack {
                AsyncImage(url: URL(string: card.imageURL), transaction: Transaction(animation: .easeInOut)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .frame(width: 150, height: 200)
                    } else {
                        Image("mr224_back")
                            .resizable()
                            .frame(width: 150, height: 200)
                    }
                }
                Text(card.name)
            }
        }
    }
    
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
            .environmentObject(NetworkManager())
    }
}
