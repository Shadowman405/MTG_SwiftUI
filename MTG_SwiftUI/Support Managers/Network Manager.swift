//
//  Network Manager.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 25.12.22.
//

import SwiftUI
import Alamofire
import SwiftyJSON

class NetworkManager: ObservableObject {
    
    @Published var cards: [CardMTGUI] = []
    
    static let shared = NetworkManager()
    var urlMTG = ""
    
    init() {
        fetchingCards(url: urlMTG)
    }
    
    
    func fetchCards(url: String, with completion: @escaping ([CardMTGUI]) -> ()) {
        //let url = "https://api.magicthegathering.io/v1/cards?page=311"
        
        AF.request(url, method: .get).validate().responseJSON { responseData in
            switch responseData.result {
            case .success(let value):
                guard let cardData = CardMTGUI.getAllCards(from: value) else {return}
                
                DispatchQueue.main.async {
                    completion(cardData)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchingCards(url: String) {
        cards.removeAll()
        fetchCards(url: urlMTG) { card in
            self.cards = card
        }
        cards = cards.sorted{$0.name < $1.name}
    }
}


class ImageManager {
    static var shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: URL, completion: @escaping (Data,URLResponse) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {print(error?.localizedDescription ?? "Error, no description")
                return
            }
            completion(data, response)
        }.resume()
    }
}
