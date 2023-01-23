//
//  NoPlayersView.swift
//  Virtual Banker
//
//  Created by Berke Turanlioglu on 23.01.2023.
//

import SwiftUI

struct NoPlayersView: View {
    
    private let plusSymbol = Image(systemName: "plus")
    @State private var isAddPressed = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("No players here...")
                    .font(.title)
                    .foregroundColor(.secondary)
                
                Text("Let's add new players by clicking the button below")
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 4, leading: 10, bottom: 20, trailing: 10))
                
                Button(action: {
                    self.isAddPressed = true
                }) {
                    Text("\(plusSymbol) Add new player")
                        .foregroundColor(.accentColor)
                        .frame(alignment: .center)
                }
                
                Spacer()
                    .frame(maxHeight: 60)
            }
            .navigationTitle("Players List")
            .navigationDestination(isPresented: $isAddPressed) {
                AddPlayerView()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: Text("Settings")) {
                        Text("Settings")
                    }
                }
            }
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
