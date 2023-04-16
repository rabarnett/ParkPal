//
//  LargeButton.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import SwiftUI

struct LargeButton: View {
    
    let text: String
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 60)
                .frame(width: 300, height: 70)
                .foregroundColor(Color("DarkGreen"))
                .offset(y:6)
            
            RoundedRectangle(cornerRadius: 60)
                .foregroundColor(Color("LightGreen"))
                .frame(width: 300, height: 70)
            
            Text(text)
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}

struct LargeButton_Previews: PreviewProvider {
    static var previews: some View {
        LargeButton(text: "Log In")
    }
}
