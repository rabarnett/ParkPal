//
//  CardStack.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import SwiftUI

struct CardStack: View {
    
    @EnvironmentObject var userModel: UserController
    
    var body: some View {
        ZStack {
            ForEach(userModel.locations, id: \.self) { location in
                Card(location: location)
            }
        }
    }
}

struct CardStack_Previews: PreviewProvider {
    static var previews: some View {
        CardStack()
            .environmentObject(UserController())
    }
}
