//
//  SignUp.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import SwiftUI

struct SignUp: View {
    
    @State private var fname = ""
    @State private var lname = ""
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var error = ""
    
    @EnvironmentObject var userModel: UserController
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            
            HStack {
                BackButton()
                Spacer()
            }
            .padding(.leading)
            
            Spacer()
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
                .padding()
            
            TextField("First Name", text: $fname)
                .textContentType(.name)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color("LightGreen"))
                }
                .frame(width: 300, height: 50)
            
            TextField("Last Name", text: $lname)
                .textContentType(.familyName)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color("LightGreen"))
                }
                .frame(width: 300, height: 50)
            
            TextField("Username", text: $username)
                .textContentType(.username)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color("LightGreen"))
                }
                .frame(width: 300, height: 50)
            
            TextField("email", text: $email)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color("LightGreen"))
                }
                .frame(width: 300, height: 50)
            
            SecureField("password", text: $password)
                .textContentType(.newPassword)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color("LightGreen"))
                }
                .frame(width: 300, height: 50)
            
            Button {
                Task {

                    do {
                        try await DataBaseController().createUser(fname: fname, lname: lname, username: username, password: password, email: email, userController: userModel)
                        viewRouter.changeView(to: .home)
                    } catch {
                        self.error = error.localizedDescription
                    }

                }
            } label: {
                LargeButton(text: "Sign In")
            }
            .padding(.top, 90)
            
            Spacer()
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
            .environmentObject(UserController())
            .environmentObject(ViewRouter())
    }
}
