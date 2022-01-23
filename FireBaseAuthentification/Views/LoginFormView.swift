//
//  LoginForm.swift
//  FireBaseAuthentification
//
//  Created by Konstantin Kirillov on 23.01.2022.
//

import SwiftUI

struct LoginFormView: View {
    
    @State private var login: String = ""
    @State private var password: String = ""
    @ObservedObject var loginData: LoginData
    
    var body: some View {
        VStack {
            Text("Enter your data")
                .font(.largeTitle)
                .padding(.bottom, 30)
            VStack(spacing: 20) {
                TextField("login", text: $login)
                TextField("password", text: $password)
                Button {
                    loginData.email = login
                    loginData.password = password
                    Task {
                        do {
                            try await loginData.signInUser()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                } label: {
                    Text("Sign in")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background(RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.blue))
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 40)
            NavigationLink("Sign up") {
                SignUpFormView(loginData: loginData)
                    .navigationBarBackButtonHidden(true)
            }
            .foregroundColor(.blue)
            .padding(.top, 30)
        }
        
    }
}

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginFormView(loginData: LoginData())
    }
}
