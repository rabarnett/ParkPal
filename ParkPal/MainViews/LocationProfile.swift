//
//  LocationProfile.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import SwiftUI

struct LocationProfile: View {
    
    
    let location: Location
    @Environment(\.dismiss) var dismiss
    
    var latitude: Float {
        switch location.locname
        {
            case "Schuman Park":
                return 37.955251803
            case "Green Acres Parl":
                return 37.940493480
            case "Ber Juan Park":
                return 37.953055339
            case "Coventry Park":
                return 37.939530187
            case "Beuhler Park":
                return 37.943676242
            case "Wedgewood Park":
                return 37.932680392
            default:
                return 0.0
        }
    }
    
    var longitude: Float {
        switch location.locname
        {
            case "Schuman Park":
                return -91.768519769
            case "Green Acres Parl":
                return -91.76528727
            case "Ber Juan Park":
                return -91.75967213
            case "Coventry Park":
                return -91.74302411
            case "Beuhler Park":
                return -91.788981264
            case "Wedgewood Park":
                return -91.75314996
            default:
                return 0.0
        }
    }
    
    
    var body: some View {
        ZStack {
            
            Image(location.locname)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 10)
            
            VStack {
                
                Text(location.locname)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                    .foregroundColor(.white)
                
                Divider()
                    .overlay(Color.white)
                
                Text(location.description)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.leading)
                    .frame(width: 400)
                    
                
                Text("Hours: \(location.open)-\(location.close)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.top)
                
                MapView(latitude: latitude, longitude: longitude)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .frame(width: 355)
            }
        }
    }
}

struct LocationProfile_Previews: PreviewProvider {
    static var previews: some View {
        LocationProfile(location: Location(locname: "Schuman Park", loclatiwhole: 37, loclatidecimal: 95096599, loclongiwhole: -91, loclongidecimal: 77839790, open: "9:00am", close: "5:00pm", rating: 0, description: "Schuman Park is a public park located in Rolla, Missouri. It offers various recreational amenities such as playgrounds, picnic areas, walking trails, and sports fields. The park also has a small lake with a fountain and hosts community events throughout the year, making it a popular spot for locals and visitors."))
    }
}
