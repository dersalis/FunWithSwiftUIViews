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
        FrendRowView(frend: Frend(id: 2, fName: "Monika", lName: "Osa", age: 36, email: "monsa@wp.pl"))
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
