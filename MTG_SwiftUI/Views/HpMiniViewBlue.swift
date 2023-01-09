//
//  HpMiniViewBlue.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 10.01.23.
//

import SwiftUI

struct HpMiniViewBlue: View {
    @Binding var hp : Int
    @State private var showAlert = false
    @State var color = UIColor.red
    
    var body: some View {
        ZStack {
            Color(color)
            HStack {
                Button {
                    self.hp += 1
                } label: {
                    Text("+")
                }
                .offset(x: -90)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 40))
                
                Text("\(hp)")
                    .fontWeight(.bold)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                
                
                Button {
                    if hp == 1 {
                        self.showAlert.toggle()
                        self.hp = 0
                    } else {
                        self.hp -= 1
                    }
                } label: {
                    Text("-")
                }
                .offset(x: 90)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 40))
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("You lose"), dismissButton: .default(Text("Cancel")))
        }
    }
}

//struct HpMiniViewBlue_Previews: PreviewProvider {
//    static var previews: some View {
//        HpMiniViewBlue()
//    }
//}
