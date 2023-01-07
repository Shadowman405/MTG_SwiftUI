//
//  HpMiniView.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 7.01.23.
//

import SwiftUI

struct HpMiniView: View {
    @State var hp = 0
    
    var body: some View {
        ZStack {
            Color(.red)
            HStack {
                Button {
                    print("+")
                } label: {
                    Text("+")
                }
                
                Text("\(hp)")
                
                Button {
                    print("-")
                } label: {
                    Text("-")
                }
            }
        }
    }
}

struct HpMiniView_Previews: PreviewProvider {
    static var previews: some View {
        HpMiniView()
    }
}
