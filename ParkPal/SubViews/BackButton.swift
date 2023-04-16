//
//  BackButton.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import SwiftUI

struct BackButton: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        
        Button {
            viewRouter.goBack()
        } label: {
            Image(systemName: "arrow.backward")
                .foregroundColor(Color("LightGreen"))
                .font(.largeTitle)
        }

    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
            .environmentObject(ViewRouter())
    }
}
