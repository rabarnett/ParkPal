//
//  Location.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import Foundation
import CoreLocation


struct Location: Codable, Hashable {
    
    var locname: String
    var loclatiwhole: Int
    var loclatidecimal: Int
    var loclongiwhole: Int
    var loclongidecimal: Int
    var open: String
    var close: String
    var rating: Int
    var description: String
    
    
    var distanceTo: String {
        
        let lat1 = locConvert ( locwhole : 37, locdec: 95096599)
        let lon1 = locConvert ( locwhole : -91, locdec : 77839790, islon: true)
        let coordinate0 = CLLocation(latitude : CLLocationDegrees(lat1), longitude : CLLocationDegrees(lon1))
        let lat2 = locConvert ( locwhole : loclatiwhole, locdec: loclatidecimal)
        let lon2 = locConvert ( locwhole : loclongiwhole, locdec : loclongidecimal, islon: true)
        let coordinate1 = CLLocation(latitude : CLLocationDegrees(lat2), longitude : CLLocationDegrees(lon2))

        let distanceInMeters = coordinate0.distance(from : coordinate1)
        var distanceInMiles : Float
        distanceInMiles = Float(distanceInMeters / 1609.0)
        return String(format: "%.2f", distanceInMiles)
    }
    
    var longitude: Float {
        locConvert(locwhole: loclongiwhole, locdec: loclongidecimal, islon : true)
    } 
    
    var latitude: Float {
        locConvert(locwhole: loclatiwhole, locdec: loclatidecimal)
    }
    
    func locConvert( locwhole: Int, locdec: Int, islon: Bool = false ) -> Float
    {
        var count : Int = 0;
        var tempdec: Int = locdec;
        if(locdec == 0)
        {
            return (Float(locwhole) + 0.0);
        }
        while(tempdec > 10)
        {
            tempdec = tempdec / 10;
            count = count + 1;
        }
        count = count * -1 //We want to use it to turn the decimal portion into a decimal
        var decCount : Float
        decCount = Float(count) - 1 //Subtract 1 extra to get everything behind the 0
        var result : Float
        var multiplier : Float
        multiplier = pow(10.0, decCount)
        //print(decCount)
        //print(multiplier)
        if(islon)
        {
            result = Float(locwhole) - (Float(locdec) *  multiplier)
        }
        else
        {
            result = Float(locwhole) + (Float(locdec) *  multiplier);
        }
        return result;
    }
    
}
