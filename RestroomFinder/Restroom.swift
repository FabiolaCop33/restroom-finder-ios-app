//
//  Restroom.swift
//  RestroomFinder
//
//  Created by Fabiola Correa Padilla on 08/05/24.
//

import Foundation
import MapKit

struct Restroom : Decodable, Identifiable {
    let id: Int
    let name: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
