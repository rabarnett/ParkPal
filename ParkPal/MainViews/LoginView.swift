//
//  LoginView.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @EnvironmentObject var userModel: UserController
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            
            HStack {
                BackButton()
                Spacer()
            }
            .padding()
            
            Spacer()
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
            
            Spacer()
            
            TextField("Enter email or username", text: $email)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color("LightGreen"))
                }
                .frame(width: 300, height: 50)
            
            SecureField("Enter password", text: $password)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color("LightGreen"))
                }
                .frame(width: 300, height: 50)
            
            Spacer()
            
            Button {
                Task {
                    do {
                        try await DataBaseController().fetchUser(name: email, password: password, userController: userModel)
                        viewRouter.changeView(to: .home)
                    } catch {}
                }
                viewRouter.changeView(to: .home)
            } label: {
                LargeButton(text: "Log In")
            }

            
            Spacer()
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(ViewRouter())
    }
}
