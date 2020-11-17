//
//  CircleAvatarView.swift
//  FunWithSwiftUIViews
//
//  Created by Damian Ruta on 17/11/2020.
//

import SwiftUI

struct CircleAvatarView: View {
    @State var image: String
    
    var body: some View {
        Image(image).resizable().frame(width: 80, height: 80, alignment: .center)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(Color.white, lineWidth: 4)).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct CircleAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        CircleAvatarView(image: "face1").previewLayout(.fixed(width: 120, height: 120))
        CircleAvatarView(image: "face2").previewLayout(.fixed(width: 120, height: 120))
        CircleAvatarView(image: "face3").previewLayout(.fixed(width: 120, height: 120))
    }
}
