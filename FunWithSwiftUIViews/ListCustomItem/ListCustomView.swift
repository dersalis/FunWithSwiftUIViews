//
//  ListCustomView.swift
//  FunWithSwiftUIViews
//
//  Created by Damian Ruta on 17/11/2020.
//

import SwiftUI

struct ListCustomView: View {
    @ObservedObject var trailsStorage = TrailStorage()
    
    var body: some View {
        List(trailsStorage.trails) { trail in
            TrailRowView(trail: trail)
        }
    }
}

struct ListCustomView_Previews: PreviewProvider {
    static var previews: some View {
        ListCustomView()
    }
}
