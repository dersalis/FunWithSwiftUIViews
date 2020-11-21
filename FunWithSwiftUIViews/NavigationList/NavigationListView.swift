//
//  NavigationListView.swift
//  FunWithSwiftUIViews
//
//  Created by Damian Ruta on 20/11/2020.
//

import SwiftUI

struct NavigationListView: View {
    @EnvironmentObject var frendsStore: FrendsStorage
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $frendsStore.showOnlyFavorite, label: {
                    Text("Pokaż ulubionych")
                })
                ForEach (frendsStore.frends) {frend in
                    if !self.frendsStore.showOnlyFavorite || frend.isFavorite {
                        NavigationLink(destination: FrendDetailView(frend: frend)) {
                            FrendRowView(frend: frend)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Frends"))
        }
    }
}

struct NavigationListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationListView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .environmentObject(FrendsStorage())
    }
}
