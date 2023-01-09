//
//  HealthCounterView.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 7.01.23.
//

import SwiftUI

struct HealthCounterView: View {
    @State var health = 20
    
    var body: some View {
        VStack(spacing: 0){
            HpMiniView(hp: health, color: .red)
                .rotationEffect(.degrees(180))
            
            HpMiniView(hp: health, color: .blue)
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button{
                    print("Refresh")
                    self.health = 20
                } label: {
                    Image(systemName: "gobackward")
                }
            }
        }
    }
}

struct HealthCounterView_Previews: PreviewProvider {
    static var previews: some View {
        HealthCounterView()
    }
}
