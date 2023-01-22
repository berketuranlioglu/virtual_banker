//
//  MainViewModel.swift
//  Virtual Banker
//
//  Created by Berke Turanlioglu on 22.01.2023.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var players: [PlayerModel] = [
        PlayerModel(name: "Player1", money: 999),
        PlayerModel(name: "Player2", money: 999),
        PlayerModel(name: "Player3", money: 999)
    ]
    
    func deleteItem(indexSet: IndexSet) {
        players.remove(atOffsets: indexSet)
    }
}
