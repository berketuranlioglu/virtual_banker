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
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 5, height: 20)
                .foregroundColor(Color(wordName: player.color))
            Text(player.name)
            Spacer()
            Text("$\(player.money)")
                .foregroundColor(.green)
        }
    }
}

struct PlayerRowView_Previews: PreviewProvider {
    
    static let dummy1 = PlayerModel(name: "Player1", money: 999, color: "pink")
    
    static var previews: some View {
        PlayerRowView(player: dummy1)
            .previewLayout(.sizeThatFits)
    }
}

extension Color {
    
    init?(wordName: String) {
        switch wordName {
        case "black":       self = .black
        case "gray":        self = .gray
        case "red":         self = .red
        case "green":       self = .green
        case "blue":        self = .blue
        case "orange":      self = .orange
        case "yellow":      self = .yellow
        case "pink":        self = .pink
        case "purple":      self = .purple
        default:            return nil
        }
    }
}
