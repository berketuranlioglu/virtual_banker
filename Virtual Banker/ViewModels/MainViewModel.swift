//
//  MainViewModel.swift
//  Virtual Banker
//
//  Created by Berke Turanlioglu on 22.01.2023.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var players: [PlayerModel] = [
        PlayerModel(name: "Player1", money: 444),
        PlayerModel(name: "Player1", money: 444),
        PlayerModel(name: "Player1", money: 444)
    ] {
        didSet {
            saveToUserDefaults()
        }
    }
    
    @Published var startingMoney: Float = 0.0
    @Published var goAmount: Float = 0.0
    
    private let key = "players_list"
    private let moneyKey = "startingMoney"
    private let goAmountKey = "goAmountMoney"
    
    init() {
        getPlayers()
    }
    
    func getPlayers() {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let savedPlayers = try? JSONDecoder().decode([PlayerModel].self, from: data)
        else { return }
        self.players = savedPlayers
        
        self.startingMoney = UserDefaults.standard.float(forKey: moneyKey)
        self.goAmount = UserDefaults.standard.float(forKey: goAmountKey)
    }
    
    func deletePlayer(indexSet: IndexSet) {
        players.remove(atOffsets: indexSet)
    }
    
    func restartGame() {
        players.removeAll()
    }
    
    func addPlayer(name: String, money: String, color: String) {
        let newPlayer = PlayerModel(name: name, money: Float(money)!, color: color)
        players.append(newPlayer)
    }
    
    func saveToUserDefaults() {
        if let encodedData = try? JSONEncoder().encode(players) {
            UserDefaults.standard.set(encodedData, forKey: key)
            UserDefaults.standard.set(startingMoney, forKey: moneyKey)
            UserDefaults.standard.set(goAmount, forKey: goAmountKey)
        }
    }
    
    func updatePlayer(player: PlayerModel) {
        if let index = players.firstIndex(where: { $0.id == player.id }) {
            players[index] = player.update(newMoney: player.money)
        }
    }
}
