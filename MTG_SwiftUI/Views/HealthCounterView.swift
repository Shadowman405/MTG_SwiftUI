//
//  HealthCounterView.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 7.01.23.
//

import SwiftUI

struct HealthCounterView: View {
    @State var healthRed = 20
    @State var healthBlue = 20
    
    var body: some View {
        VStack(spacing: 0){
            HpMiniViewRed(hp: $healthRed, color: .red)
                .rotationEffect(.degrees(180))
            
            HpMiniViewBlue(hp: $healthBlue, color: .blue)
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button{
                    print("Refresh")
                    self.healthBlue = 20
                    self.healthRed = 20
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
