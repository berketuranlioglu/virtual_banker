//
//  PlayerRowView.swift
//  Virtual Banker
//
//  Created by Berke Turanlioglu on 22.01.2023.
//

import SwiftUI

struct PlayerRowView: View {
    
    let player: PlayerModel
    
    var body: some View {
        HStack {
            Text(player.name)
            Spacer()
            Text("$\(player.money)")
                .foregroundColor(.green)
        }
    }
}

struct PlayerRowView_Previews: PreviewProvider {
    
    static let dummy1 = PlayerModel(name: "Player1", money: 999)
    
    static var previews: some View {
        PlayerRowView(player: dummy1)
            .previewLayout(.sizeThatFits)
    }
}
