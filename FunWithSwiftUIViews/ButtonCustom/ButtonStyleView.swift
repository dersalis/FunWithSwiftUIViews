//
//  ButtonStyleView.swift
//  FunWithSwiftUIViews
//
//  Created by Damian Ruta on 17/11/2020.
//

import SwiftUI

struct ButtonStyleView: View {
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            HStack {
                Image(systemName: "bookmark.fill")
                Text("Zakładki")
            }
        }).buttonStyle(ButtonGradientStyle())
    }
}

struct ButtonGradientStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.foregroundColor(Color.white).padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing)).cornerRadius(10.0).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 0.5))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct ButtonStyleView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleView().previewLayout(.fixed(width: 300, height: 100))
    }
}
