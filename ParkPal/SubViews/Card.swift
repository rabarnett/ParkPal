//
//  Card.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import SwiftUI

struct Card: View {
    
    let location: Location
    
    @State private var offset = CGSize.zero
    @State private var showProfile = false
    
    
    var drag: some Gesture {
        
        DragGesture()
            .onChanged { value in
                withAnimation(.spring()) {
                    offset = value.translation
                }
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    switch(value.translation.width) {
                    case -.infinity...(-200):
                        offset = CGSize(width: -500, height: value.translation.height)
                    case 200...(.infinity):
                        offset = CGSize(width: 500, height: value.translation.height)
                    default:
                        offset = CGSize.zero
                    }
                }
            }
    }
    
    var body: some View {
        ZStack {
            
            Image(location.locname)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .frame(width: 300, height: 500)
                .aspectRatio(contentMode: .fit)
            
            
            VStack(alignment: .leading) {
                
                Spacer()
                
                HStack {
                    ForEach(1...5, id: \.self) {i in
                        Image(systemName: "star.fill")
                            .foregroundColor(i <= location.rating ? .yellow : .white)
                    }
                }
                .padding(.leading)
                
                HStack {
                    Text(location.locname)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    
                    Spacer()
                }
                .padding(.leading)
                
                Text("\(Image(systemName: "location.fill")) \(location.distanceTo) Miles Away")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding([.bottom, .leading])
            }
            .frame(width: 300, height: 500)
        }
        .offset(offset)
        .rotationEffect(.degrees(Double(offset.width/30)))
        .gesture(drag)
        .onTapGesture {
            showProfile = true
        }
        .sheet(isPresented: $showProfile) {
            LocationProfile(location: location)
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(location: Location(locname: "", loclatiwhole: 0, loclatidecimal: 0, loclongiwhole: 0, loclongidecimal: 0, open: "", close: "", rating: 1, description: ""))
    }
}
