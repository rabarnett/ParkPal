//
//  StartScreen.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import SwiftUI
import CoreLocationUI

struct StartScreen: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
            
          
            Spacer()
            
            Button {
                viewRouter.changeView(to: .login)
            } label: {
                LargeButton(text: "Log In")
            }

            
            Button {
                viewRouter.changeView(to: .signUp)
            } label: {
                LargeButton(text: "Sign Up")
            }
            
            Spacer()
        }
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen()
            .environmentObject(ViewRouter())
    }
}
