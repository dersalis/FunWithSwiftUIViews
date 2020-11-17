//
//  HorizontalScrollView.swift
//  FunWithSwiftUIViews
//
//  Created by Damian Ruta on 17/11/2020.
//

import SwiftUI

struct HorizontalScrollView: View {
    var body: some View {
        VStack {
            Divider()
            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    CircleAvatarView(image: "face1")
                    CircleAvatarView(image: "face2")
                    CircleAvatarView(image: "face3")
                    CircleAvatarView(image: "face4")
                    CircleAvatarView(image: "face5")
                    CircleAvatarView(image: "face6")
                    CircleAvatarView(image: "face7")
                }.padding()
            }.frame(height: 100)
            Divider()
            Spacer()
        }
    }
}

struct HorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScrollView()
    }
}
