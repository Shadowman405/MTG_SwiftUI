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
    @State var manaImage: String?
    
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
            HStack {
                Text("Mana Cost: " + card.manaCost)
                Image(manaImage ?? "G")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            Text("Description")
            Text(card.text)
            
        }
        .navigationTitle(card.name)
        .onAppear{
            manaImage = addManaImages(someString: card.manaCost)
        }
    }
    
    func addManaImages(someString: String?) -> String {
        guard let manaCost = someString else {return String()}
        let imagesDict: [String:String] = ["{W}":"W", "{R}":"R","{B}":"B","{G}":"G","{U}":"U", "{1}":"One", "{2}":"Two", "{3}":"Three",
                                           "{4}":"Four", "{5}":"Five", "{6}":"Six", "{7}":"Seven", "{8}":"Eight", "{9}":"Nine", "{0}":"Zero",
                                           "{T}":"T_2nd", "{G/W}":"GW", "{G/U}":"GU"]
        var fullString = manaCost
        
        for (imageTag, imageName) in imagesDict {
            if someString == imageTag {
                fullString = imageName
            }
        }
        
        print("Fullstring = " + fullString)
        return fullString
    }
}

struct CardDetailsFromCollection_Previews: PreviewProvider {
    static var previews: some View {
        let cardOne = CardMTGUI()
        
        CardDetailsFromCollection(card: cardOne, manaImage: "")
            .environmentObject(NetworkManager())
    }
}
