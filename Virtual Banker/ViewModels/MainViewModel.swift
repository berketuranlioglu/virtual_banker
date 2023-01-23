//
//  MainViewModel.swift
//  Virtual Banker
//
//  Created by Berke Turanlioglu on 22.01.2023.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var players: [PlayerModel] = [
        PlayerModel(name: "Player1", money: 999, color: "black"),
        PlayerModel(name: "Player2", money: 999, color: "purple"),
        PlayerModel(name: "Player3", money: 999, color: "orange")
    ]
    
    func deletePlayer(indexSet: IndexSet) {
        players.remove(atOffsets: indexSet)
    }
    
    func addPlayer(name: String, money: String, color: String) {
        let newPlayer = PlayerModel(name: name, money: Int(money)!, color: color)
        players.append(newPlayer)
    }
}
