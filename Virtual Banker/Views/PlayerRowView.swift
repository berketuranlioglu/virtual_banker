//
//  PlayerRowView.swift
//  Virtual Banker
//
//  Created by Berke Turanlioglu on 22.01.2023.
//

import SwiftUI

struct PlayerRowView: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
    @State var player: PlayerModel
    @State var isPlayerPressed: Bool = false
    @State var updatingAmount: String = ""
    @State var bankruptcyAlert: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 5, height: 20)
                    .foregroundColor(Color(wordName: player.color))
                Text(player.name)
                Spacer()
                player.playing
                ? Text("\(Int(player.money))")
                    .foregroundColor(player.money > 0 ? .green : .red)
                : Text("Bankrupt")
                    .foregroundColor(.red)
            }
            .onTapGesture {
                isPlayerPressed.toggle()
            }
            
            if isPlayerPressed {
                HStack {
                    Text("Player has passed GO")
                    Spacer()
                    Text("Give $\(Int(mainViewModel.goAmount))")
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            player.money += Float(mainViewModel.goAmount)
                            mainViewModel.updatePlayer(player: player)
                        }
                        .disabled(!player.playing)
                }
                .padding(.vertical)
                
                HStack {
                    Text("Update the money")
                    Spacer()
                    Group {
                        Text("$")
                        TextField("Amount...", text: $updatingAmount) {
                            player.money += Float(updatingAmount) ?? 0
                            mainViewModel.updatePlayer(player: player)
                        }
                        .frame(width: 100)
                        .disabled(!player.playing)
                    }
                }
                .padding(.bottom)
                
                Text("Declare the bankruptcy")
                    .foregroundColor(.red)
                    .onTapGesture {
                        bankruptcyAlert.toggle()
                    }
            }
        }
        .confirmationDialog("Change background",
                            isPresented: $bankruptcyAlert) {
            Button("Yes", role: .destructive) {
                player.playing = false
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure?\nYou cannot undo once you declare the bankrupt.")
        }
    }
}

struct PlayerRowView_Previews: PreviewProvider {
    
    static let dummy1 = PlayerModel(name: "Player1", money: 999, color: "pink")
    
    static var previews: some View {
        PlayerRowView(player: dummy1)
            .previewLayout(.sizeThatFits)
            .environmentObject(MainViewModel())
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
        case "brown":       self = .brown
        case "pink":        self = .pink
        case "purple":      self = .purple
        default:            return nil
        }
    }
}
