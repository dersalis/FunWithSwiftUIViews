//
//  NavigationListView.swift
//  FunWithSwiftUIViews
//
//  Created by Damian Ruta on 20/11/2020.
//

import SwiftUI

struct NavigationListView: View {
    @ObservedObject var frendsStore = FrendsStorage()
    
    var body: some View {
        NavigationView {
            List (self.frendsStore.frends) {frend in
                NavigationLink(destination: FrendDetailView(frend: frend)) {
                    FrendRowView(frend: frend)
                }
            }
            .navigationBarTitle(Text("Frends"))
        }
    }
}

struct NavigationListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationListView()
    }
}
