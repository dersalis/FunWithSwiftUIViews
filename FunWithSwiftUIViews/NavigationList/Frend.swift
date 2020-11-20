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
}


class FrendsStorage: ObservableObject {
    @Published var frends: [Frend] = [
        Frend(id: 0, fName: "Kornelia", lName: "Słaba", age: 32, email: "k.sl@wp.pl"),
        Frend(id: 1, fName: "Wiktoria", lName: "Wiśnia", age: 29, email: "wwis@wp.pl"),
        Frend(id: 2, fName: "Monika", lName: "Osa", age: 36, email: "monsa@wp.pl")
    ]
}
