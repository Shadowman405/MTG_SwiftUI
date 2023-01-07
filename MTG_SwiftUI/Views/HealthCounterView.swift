//
//  HealthCounterView.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 7.01.23.
//

import SwiftUI

struct HealthCounterView: View {
    var body: some View {
        VStack{
            HpMiniView(color: .red)
            
            HpMiniView(color: .blue)
        }
    }
}

struct HealthCounterView_Previews: PreviewProvider {
    static var previews: some View {
        HealthCounterView()
    }
}
