//
//  AddPlayerView.swift
//  Virtual Banker
//
//  Created by Berke Turanlioglu on 23.01.2023.
//

import SwiftUI

struct AddPlayerView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var mainViewModel: MainViewModel
    
    @State var nameText: String = ""
    @State var moneyText: String = ""
    @State var selectedColor: String = "Black"
    
    let colors = ["Black", "Gray", "Red", "Orange",
                  "Yellow", "Green", "Blue", "Purple", "Pink"
    ]
    
    var body: some View {
        Form {
            Section(content: {
                TextField("Name...", text: $nameText)
                TextField("Starting USD...", text: $moneyText)
            }, header: {
                Text("Name / Money")
            })
            
            Section(content: {
                Picker("Pick the color for player", selection: $selectedColor) {
                    ForEach(colors, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
            }, header: {
                Text("Color")
            })
            
            Button(action: saveButtonPressed) {
                Text("Save")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .listRowBackground(Color.accentColor)
        }
        .navigationTitle("👾 Add new player 👾")
    }
    
    func saveButtonPressed() {
        mainViewModel.addPlayer(name: nameText, money: moneyText, color: selectedColor.lowercased())
        self.dismiss()
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddPlayerView()
        }
        .environmentObject(MainViewModel())
    }
}
