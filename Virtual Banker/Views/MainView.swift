//
//  MainView.swift
//  Virtual Banker
//
//  Created by Berke Turanlioglu on 22.01.2023.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
    @State var isAddPressed = false
    
    let plusSymbol = Image(systemName: "plus")
    
    var body: some View {
        NavigationStack {
            if mainViewModel.players.isEmpty {
                NoPlayersView()
            } else {
                List {
                    ForEach(mainViewModel.players) { item in
                        PlayerRowView(player: item)
                    }
                    .onDelete(perform: mainViewModel.deletePlayer)
                    
                    Button(action: {
                        isAddPressed = true
                    }) {
                        Text("\(plusSymbol) Add new player")
                            .foregroundColor(.accentColor)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .navigationTitle("Players List")
                .navigationDestination(isPresented: $isAddPressed) {
                    AddPlayerView()
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: Text("Settings")) {
                            Text("Settings")
                        }
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView()
        }
        .environmentObject(MainViewModel())
    }
}

/*
 VStack {
     Spacer()
     HStack {
         Spacer()
         Button(action: {
             isAddPressed = true
         }) {
             Text("\(plusSymbol) Add new player")
                 .font(.title3)
                 .frame(width: .infinity, height: 60, alignment: .center)
                 .foregroundColor(.white)
                 .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
         }
         .background(Color.accentColor)
         .clipShape(Capsule())
         .padding(.horizontal)
         .navigationDestination(isPresented: $isAddPressed) {
             Text("Add new player")
         }
     }
 }
 */
