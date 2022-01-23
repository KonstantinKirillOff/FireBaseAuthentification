//
//  FireBaseAuthentificationApp.swift
//  FireBaseAuthentification
//
//  Created by Konstantin Kirillov on 19.01.2022.
//

import SwiftUI
import Firebase

@main
struct FireBaseAuthentificationApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
