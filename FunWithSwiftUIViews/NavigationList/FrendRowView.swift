//
//  FrendRowView.swift
//  FunWithSwiftUIViews
//
//  Created by Damian Ruta on 20/11/2020.
//

import SwiftUI

struct FrendRowView: View {
    var frend: Frend
    
    var body: some View {
        HStack {
            if self.frend.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            } else {
                Image(systemName: "star")
                    .foregroundColor(Color.gray.opacity(0.25))
            }
            VStack (alignment: .leading) {
                Text(self.frend.fName + " " + self.frend.lName)
                Text(self.frend.email)
                    .font(.caption)
                    .foregroundColor(Color.gray)
            }
            Spacer()
            Text(String(self.frend.age))
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

struct FrendRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FrendRowView(frend: Frend(id: 2, fName: "Monika", lName: "Osa", age: 36, email: "monsa@wp.pl", isFavorite: true))
            FrendRowView(frend: Frend(id: 2, fName: "Monika", lName: "Osa", age: 36, email: "monsa@wp.pl", isFavorite: false))
        }
        .previewLayout(.fixed(width: 300, height: 100))
        
    }
}
