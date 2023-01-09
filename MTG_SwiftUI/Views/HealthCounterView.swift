//
//  HealthCounterView.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 7.01.23.
//

import SwiftUI

struct HealthCounterView: View {
    var body: some View {
        VStack(spacing: 0){
            HpMiniView(color: .red)
                .rotationEffect(.degrees(180))
            
            HpMiniView(color: .blue)
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button{
                    print("Refresh")
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
