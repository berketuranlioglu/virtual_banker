//
//  NoPlayersView.swift
//  Virtual Banker
//
//  Created by Berke Turanlioglu on 23.01.2023.
//

import SwiftUI

struct NoPlayersView: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
    private let plusSymbol = Image(systemName: "plus")
    @State private var isAddPressed = false
    @State private var isAlert = false
    @State private var startingMoney = ""
    @State private var goMoney = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Looks like the game has not started yet.")
                    .font(.title)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                
                HStack {
                    Text("Enter the starting money:")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 4, leading: 4, bottom: 10, trailing: 4))
                    TextField("here...", text: $startingMoney) {
                        mainViewModel.startingMoney = Float(startingMoney)!
                    }
                    .padding(.leading)
                    .background(Color.green.opacity(0.2))
                    .foregroundColor(Color(red: 0/255, green: 51/255, blue: 51/255))
                    .frame(width: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .offset(y:-2)
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Enter the amount of salary when a player passes GO:")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 4, leading: 4, bottom: 10, trailing: 4))
                    TextField("here...", text: $goMoney) {
                        mainViewModel.goAmount = Float(goMoney)!
                    }
                    .padding(.leading)
                    .background(Color.green.opacity(0.2))
                    .foregroundColor(Color(red: 0/255, green: 51/255, blue: 51/255))
                    .frame(width: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .offset(y:-2)
                }
                .padding(.horizontal)
                
                Text("Let's add new players by clicking the button below")
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 50, leading: 10, bottom: 20, trailing: 10))
                
                Button(action: addNewPlayerPressed) {
                    Text("\(plusSymbol) Add new player")
                        .foregroundColor(.accentColor)
                        .frame(alignment: .center)
                }
                
                Spacer()
                    .frame(maxHeight: 60)
            }
            .offset(y: -10)
            .alert("Enter the starting money before adding the players",
                   isPresented: $isAlert, actions: {})
            .navigationTitle("Players List")
            .navigationDestination(isPresented: $isAddPressed) {
                AddPlayerView()
            }
        }
    }
    
    func addNewPlayerPressed() {
        if startingMoney.isEmpty {
            isAlert.toggle()
        } else {
            isAddPressed = true
        }
    }
}

struct NoPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoPlayersView()
        }
        .environmentObject(MainViewModel())
    }
}
