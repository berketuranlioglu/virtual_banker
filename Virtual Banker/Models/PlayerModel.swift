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
    
    init(id: String = UUID().uuidString, name: String, money: Int) {
        self.id = id
        self.name = name
        self.money = money
    }
}
