//
//  Trail.swift
//  FunWithSwiftUIViews
//
//  Created by Damian Ruta on 17/11/2020.
//

import Foundation

struct Trail: Identifiable {
    var id = UUID()
    var name: String
    var location: String
    var distance: Double
}


class TrailStorage: ObservableObject {
    @Published var trails: [Trail] = [
        Trail(name: "Stanford Dish", location: "Palo Alto", distance: 3.9),
        Trail(name: "Edgewood", location: "Redwood City", distance: 3.2),
        Trail(name: "Mission Peak", location: "Fremont", distance: 7.1),
        Trail(name: "Big Basin", location: "Boulder Creek", distance: 4.3),
        Trail(name: "Alum Rock", location: "Milpitas", distance: 5.7)
    ]
}
