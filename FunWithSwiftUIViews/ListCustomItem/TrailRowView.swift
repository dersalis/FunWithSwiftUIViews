//
//  TrailRowView.swift
//  FunWithSwiftUIViews
//
//  Created by Damian Ruta on 17/11/2020.
//

import SwiftUI

struct TrailRowView: View {
    var trail: Trail
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(trail.name)
                Text(trail.location)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            Spacer()
            Text(String(format: "%.f km", trail.distance))
        }
    }
}

struct TrailRowView_Previews: PreviewProvider {
    static var previews: some View {
        TrailRowView(trail: Trail(name: "Czarnków", location: "Wielkopolska", distance: 34.0))
    }
}
