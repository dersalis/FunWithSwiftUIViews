//
//  FrendDetailView.swift
//  FunWithSwiftUIViews
//
//  Created by Damian Ruta on 20/11/2020.
//

import SwiftUI

struct FrendDetailView: View {
    var frend: Frend
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    VStack (alignment: .leading) {
                        Text(self.frend.lName)
                            .font(.title2)
                        Text(self.frend.fName)
                            .font(.title3)
                            .fontWeight(.light)
                    }
                    Text(String(self.frend.age))
                        .font(.title)
                        .padding()
                }
                Divider()
                Text(self.frend.email)
                    .font(.caption)
                    .foregroundColor(Color.gray)
                Spacer()
            }
            .padding()
        }
        .navigationBarTitle(Text(self.frend.fName), displayMode: .inline)
    }
}

struct FrendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrendDetailView(frend: Frend(id: 2, fName: "Monika", lName: "Osa", age: 36, email: "monsa@wp.pl", isFavorite: true))
    }
}
