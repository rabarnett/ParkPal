//
//  ContentView.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var userModel: UserController
    
    var body: some View {
        ZStack {
            
            Color("BlueGreen")
                .edgesIgnoringSafeArea(.all)
            
            switch viewRouter.view {
            case .start:
                StartScreen()
            case .signUp:
                SignUp()
            case .login:
                LoginView()
            case .home:
                if userModel.user == nil {
                    ProgressView()
                } else {
                    HomeView()
                }
            }
        }
        .animation(.easeIn, value: viewRouter.view)
        .onAppear {
            Task {
                do {
                    try await DataBaseController().fetchLocations(userController: userModel)
                } catch {}
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewRouter())
            .environmentObject(UserController())
    }
}
