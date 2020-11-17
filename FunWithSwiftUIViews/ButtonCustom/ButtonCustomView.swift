//
//  ButtonCustomView.swift
//  FunWithSwiftUIViews
//
//  Created by Damian Ruta on 17/11/2020.
//

import SwiftUI

struct ButtonCustomView: View {
    @State var count = 0
    var body: some View {
        VStack {
            Spacer()
            ButtonBorderView()
            Spacer()
            ButtonStyleView()
            Spacer()
        }
    }
}

struct ButtonCustomView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCustomView()
    }
}
