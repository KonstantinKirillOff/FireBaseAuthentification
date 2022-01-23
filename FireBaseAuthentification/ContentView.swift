//
//  ContentView.swift
//  FireBaseAuthentification
//
//  Created by Konstantin Kirillov on 19.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var loginData = LoginData()
    @AppStorage("login_status") var loginStatus: Bool = false
    
    var body: some View {
        NavigationView {
            if loginStatus {
                CostListView(loginData: loginData)
            } else {
                LoginFormView(loginData: loginData)
                    .navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
