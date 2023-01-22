//
//  Virtual_BankerApp.swift
//  Virtual Banker
//
//  Created by Berke Turanlıoğlu on 22.01.2023.
//

import SwiftUI

@main
struct Virtual_BankerApp: App {
    
    @StateObject var mainViewModel = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
            }
            .environmentObject(mainViewModel)
        }
    }
}
