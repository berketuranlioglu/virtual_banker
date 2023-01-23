//
//  PlayerModel.swift
//  Virtual Banker
//
//  Created by Berke Turanlioglu on 22.01.2023.
//

import Foundation

struct PlayerModel: Identifiable, Codable {
    let id: String
    let name: String
    var money: Float
    let color: String
    var playing: Bool
    
    init(id: String = UUID().uuidString, name: String, money: Float, color: String = "black", playing: Bool = true) {
        self.id = id
        self.name = name
        self.money = money
        self.color = color
        self.playing = playing
    }
    
    func update(newMoney: Float) -> PlayerModel {
        return PlayerModel(id: id, name: name, money: newMoney, color: color, playing: playing)
    }
}
