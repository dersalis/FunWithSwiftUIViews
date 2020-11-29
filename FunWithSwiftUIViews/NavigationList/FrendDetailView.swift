//
//  FrendDetailView.swift
//  FunWithSwiftUIViews
//
//  Created by Damian Ruta on 20/11/2020.
//

import SwiftUI

struct FrendDetailView: View {
    @EnvironmentObject var frendsStorage: FrendsStorage
    var frend: Frend
    
    var frendIndex: Int {
        frendsStorage.frends.firstIndex(where: { $0.id == frend.id})!
    }
    
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
                    Button(action: {
                        self.frendsStorage.frends[self.frendIndex].isFavorite.toggle()
                    }, label: {
                        if self.frendsStorage.frends[self.frendIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.secondary.opacity(0.25))
                        }
                    })
                }
                Divider()
                Text(self.frend.email)
                    .font(.caption)
                    .foregroundColor(.secondary)
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
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 mini"))
            .environmentObject(FrendsStorage())
    }
}
