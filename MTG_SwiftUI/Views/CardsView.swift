//
//  CardsView.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 25.12.22.
//

import SwiftUI

struct CardsView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=409741&type=card"), transaction: Transaction(animation: .easeInOut)) { phase in
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
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
