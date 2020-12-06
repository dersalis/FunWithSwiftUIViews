//
//  TabBarCustomTwo.swift
//  FunWithSwiftUIViews
//
//  Created by Damian Ruta on 06/12/2020.
//

import SwiftUI

struct TabBarCustomTwo: View {
    @State private var selection: Int = 0
    
    var body: some View {
        VStack {
            TabView (selection: $selection) {
                Text("Tab Content 1")
                    .tag(0)
                Text("Tab Content 2")
                    .tag(1)
                Text("Tab Content 3")
                    .tag(2)
                Text("Tab Content 4")
                    .tag(3)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Divider();
            
            BarBottomTwoView(selection: $selection)
            
        }
    }
}


struct BarBottomTwoView: View {
    @Binding var selection: Int
    @Namespace private var currentTab
    
    var body: some View {
        HStack(alignment: .bottom) {
            ForEach(tbcoTabs.indices) { index in
                GeometryReader { geo in
                    VStack (spacing: 4) {
                        if selection == index {
                            Color(.label)
                                .frame(height: 2)
                                .offset(y: -8)
                                .matchedGeometryEffect(id: "currentTab", in: currentTab)
                        }
                        
                        if tabsTwo[selection].label == "Notifications" && tabsTwo[selection].label == "Notifications" {
                            Image(systemName: tabsTwo[index].image)
                                .frame(height: 20)
                                .rotationEffect(.degrees(20))
                        }
                        else {
                            Image(systemName: tabsTwo[index].image)
                                .frame(height: 20)
                                .rotationEffect(.degrees(0))
                        }
                        Text(tabsTwo[index].label)
                            .font(.caption2)
                            .fixedSize()
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: geo.size.width / 2, height: 44, alignment: .bottom)
                    .padding(.horizontal)
                    .foregroundColor(selection == index ? Color(.label) : .secondary)
                    .onTapGesture {
                        withAnimation {
                            selection = index
                        }
                    }
                }
                .frame(height: 44, alignment: .bottom)
            }
        }
    }
}


struct TabBarCustomTwo_Previews: PreviewProvider {
    static var previews: some View {
        TabBarCustomTwo()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 mini"))
    }
}

struct TabTwo {
    let image: String
    let label: String
}

let tabsTwo = [
    TabTwo(image: "house.fill", label: "Home"),
    TabTwo(image: "person.2.fill", label: "My Network"),
    TabTwo(image: "plus.square.fill", label: "Post"),
    TabTwo(image: "bell.fill", label: "Notification"),
    TabTwo(image: "briefcase.fill", label: "Jobs")
]
