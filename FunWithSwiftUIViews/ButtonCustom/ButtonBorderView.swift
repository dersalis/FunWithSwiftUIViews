//
//  ButtonBorderView.swift
//  FunWithSwiftUIViews
//
//  Created by Damian Ruta on 17/11/2020.
//

import SwiftUI

struct ButtonBorderView: View {
    @State var count = 0
    var body: some View {
        
        VStack {
            Text(String(self.count))
            Button(action: {
                self.count += 1
            }, label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Button")
                }.padding(10).overlay(RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(lineWidth: 2)).shadow(color: .blue, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            })
        }
    }
}

struct ButtonBorderView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBorderView().previewLayout(.fixed(width: 300, height: 100))
    }
}
