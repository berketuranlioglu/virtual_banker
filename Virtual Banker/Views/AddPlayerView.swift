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
    @State var isAlert: Bool = false
    
    let colors = ["Black", "Gray", "Red", "Orange", "Brown",
                  "Yellow", "Green", "Blue", "Purple", "Pink"
    ]
    
    var body: some View {
        Form {
            Section(content: {
                TextField("Name...", text: $nameText)
            }, header: {
                Text("Name")
            })
            
            Section(content: {
                TextField("Starting USD...", text: $moneyText)
                    .onAppear {
                        moneyText = "\(mainViewModel.startingMoney)"
                    }
            }, header: {
                Text("Starting Money (Autofilled)")
            })
            
            Section(content: {
                Picker("Pick the color for \(nameText.isEmpty ? "..." : nameText)",
                       selection: $selectedColor) {
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
        .alert("Please enter both the name and the money of new player",
               isPresented: $isAlert, actions: {})
        .navigationTitle("👾 Add new player 👾")
    }
    
    func saveButtonPressed() {
        if !nameText.isEmpty && !moneyText.isEmpty {
            mainViewModel.addPlayer(name: nameText, money: moneyText,
                                    color: selectedColor.lowercased())
            self.dismiss()
        } else {
            isAlert.toggle()
        }
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
