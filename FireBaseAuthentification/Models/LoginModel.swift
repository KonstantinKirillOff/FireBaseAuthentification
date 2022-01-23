//
//  LoginModel.swift
//  FireBaseAuthentification
//
//  Created by Konstantin Kirillov on 23.01.2022.
//

import Firebase
import SwiftUI

class LoginData: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    @AppStorage("login_status") var loginStatus = false
    
    func signInUser() async throws {
        let _ = try await Auth.auth().signIn(withEmail: email, password: password)
        loginStatus = true
    }
    
    func signUpUser() async throws {
        let _ = try await Auth.auth().createUser(withEmail: email, password: password)
    }
    
    func signOutUser() throws {
        let _ = try Auth.auth().signOut()
        loginStatus = false
    }
}
