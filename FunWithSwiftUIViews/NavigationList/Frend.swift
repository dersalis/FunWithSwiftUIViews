//
//  Frend.swift
//  FunWithSwiftUIViews
//
//  Created by Damian Ruta on 20/11/2020.
//

import Foundation

struct Frend: Identifiable {
    var id: Int
    var fName: String
    var lName: String
    var age: Int
    var email: String
    var isFavorite: Bool
}


final class FrendsStorage: ObservableObject {
    @Published var showOnlyFavorite: Bool = false
    @Published var frends = [
        Frend(id: 0, fName: "Kornelia", lName: "Słaba", age: 32, email: "k.sl@wp.pl", isFavorite: false),
        Frend(id: 1, fName: "Wiktoria", lName: "Wiśnia", age: 29, email: "wwis@wp.pl", isFavorite: true),
        Frend(id: 2, fName: "Monika", lName: "Osa", age: 36, email: "monsa@wp.pl", isFavorite: false),
        Frend(id: 1, fName: "Olga", lName: "Manka", age: 29, email: "omans@wp.pl", isFavorite: true),
        Frend(id: 2, fName: "Malwina", lName: "Kola", age: 36, email: "malk@wp.pl", isFavorite: false)
    ]
}
