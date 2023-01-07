//
//  HpMiniView.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 7.01.23.
//

import SwiftUI

struct HpMiniView: View {
    @State private var hp = 0
    @State private var showAlert = false
 
    var body: some View {
        ZStack {
            Color(.red)
            HStack {
                Button {
                    self.hp += 1
                } label: {
                    Text("+")
                }
                
                Text("\(hp)")
                
                Button {
                    if hp != 0 {
                        self.hp -= 1
                    } else {
                        self.showAlert.toggle()
                        self.hp = 0
                    }
                } label: {
                    Text("-")
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("You lose"), dismissButton: .default(Text("Cancel")))
        }
    }
}

struct HpMiniView_Previews: PreviewProvider {
    static var previews: some View {
        HpMiniView()
    }
}
