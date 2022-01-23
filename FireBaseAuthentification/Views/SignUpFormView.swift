//
//  SignUpFormView.swift
//  FireBaseAuthentification
//
//  Created by Konstantin Kirillov on 23.01.2022.
//

import SwiftUI

struct SignUpFormView: View {
   
    @State private var login: String = ""
    @State private var password: String = ""
    @ObservedObject var loginData: LoginData
    
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Enter your data")
                .font(.largeTitle)
                .padding(.bottom, 20)
            VStack(spacing: 20) {
                TextField("login", text: $login)
                TextField("password", text: $password)
                Button {
                    loginData.email = login
                    loginData.password = password
                    Task {
                        do {
                            try await loginData.signUpUser()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                } label: {
                    Text("Register")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background(RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.blue))
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 40)
        }
    }
}

struct SignUpFormView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFormView(loginData: LoginData())
    }
}
