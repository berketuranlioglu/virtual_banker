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
    let money: Int
    let color: String
    
    init(id: String = UUID().uuidString, name: String, money: Int, color: String = "black") {
        self.id = id
        self.name = name
        self.money = money
        self.color = color
    }
}
