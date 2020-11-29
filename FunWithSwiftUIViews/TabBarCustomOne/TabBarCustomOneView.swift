//
//  TabBarCustomOneView.swift
//  FunWithSwiftUIViews
//
//  Created by Damian Ruta on 29/11/2020.
//

import SwiftUI

//var tbcoTabs: [String] = ["Home", "Restaurants", "Orders", "Rewards"]

var tbcoTabs: [TbcoTab] = [
    TbcoTab(id: 0, name: "Home", image: "house"),
    TbcoTab(id: 1, name: "Restaurants", image: "paperplane"),
    TbcoTab(id: 2, name: "Orders", image: "newspaper"),
    TbcoTab(id: 3, name: "Rewards", image: "bubble.left")
]

struct TabBarCustomOneView: View {
    var body: some View {
        NavigationView {
            TbcoHome()
        }
    }
}


struct TbcoHome: View {
    @State var selectedTab = "Home"
//    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @Namespace var animation
    @StateObject var modelData = ModelView()
    
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader {_ in
                ZStack {
                    
                    ScrollView {
                        ForEach(1...25, id:\.self) {i in
                            NavigationLink(destination: Text("Home Data \(i)")) {
                                VStack(alignment: .leading) {
                                    Text("Home Data \(i)")
                                        .padding()
                                        .foregroundColor(.black)
                                    Divider()
                                }
                            }
                                                       
                        }
                        .padding(.bottom)
                        .navigationBarHidden(true)
                    }
                    .opacity(selectedTab == "Home" ? 1 : 0)
                    
                    Text("Restaurants")
                        .opacity(selectedTab == "Restaurants" ? 1 : 0)
                    
                    Text("Orders")
                        .opacity(selectedTab == "Orders" ? 1 : 0)
                    
                    Text("Rewards")
                        .opacity(selectedTab == "Rewards" ? 1 : 0)
                }
            }
            .onChange(of: selectedTab) {(_) in
                switch(selectedTab) {
                case "Restaurants": if !modelData.isRestaurantLoad{modelData.loadRestaurant()}
                case "Orders": if !modelData.isOrderLoad{modelData.loadOrders()}
                case "Rewards": if !modelData.isRevardLoad{modelData.loadReward()}
                default: ()
                        
                }
            }
            
            HStack(spacing: 20) {
                ForEach(tbcoTabs) {tab in
                    TabButton(title: tab.name, image: tab.image, selectedTab: $selectedTab, animation: animation)
//                    if tab != tbcoTabs.last {
//                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
//                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 30)
            //.padding(.bottom, edges!.bottom == 0 ? 15 : edges!.bottom)
            .padding(.bottom, 15)
            .background(Color.white)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
    }
}


struct TabButton: View {
    var title: String
    var image: String
    @Binding var selectedTab : String
    var animation : Namespace.ID

    var body: some View{
      
      Button(action: {
          withAnimation{selectedTab = title}
      }) {
          
          VStack(spacing: 6){
              
              // Top Indicator....
              
              // Custom Shape...
              
              // Slide in and out animation...
              
              ZStack{
                  
                  TopLine()
                      .fill(Color.clear)
                      .frame(width: 45, height: 6)
                  
                  if selectedTab == title{
                      
                      TopLine()
                        .fill(Color.green)
                          .frame(width: 45, height: 6)
                          .matchedGeometryEffect(id: "Tab_Change", in: animation)
                  }
              }
              .padding(.bottom,10)
              
              Image(systemName: image)
                  .renderingMode(.template)
                  .resizable()
                .foregroundColor(selectedTab == title ? Color.green : Color.black.opacity(0.2))
                  .frame(width: 24, height: 24)
              
              Text(title)
                  .font(.caption)
                  .fontWeight(.bold)
                  .foregroundColor(Color.black.opacity(selectedTab == title ? 0.6 : 0.2))
          }
      }
    }
}


struct TopLine: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 10, height: 10))
        return Path(path.cgPath)
    }
}


struct TabBarCustomOneView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarCustomOneView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 mini"))
    }
}

class ModelView: ObservableObject {
    @Published var isOrderLoad = false
    @Published var isRestaurantLoad = false
    @Published var isRevardLoad = false
    
    init() {
        print("Home Data Loaded")
    }
    
    func loadOrders() {
        print("Order Loaded")
        isOrderLoad = true
    }
    
    func loadRestaurant() {
        print("Restaurant Loaded")
        isRestaurantLoad = true
    }
    
    func loadReward() {
        print("Reward Loaded")
        isRevardLoad = true
    }
}

struct TbcoTab: Identifiable {
    var id: Int
    var name: String
    var image: String
}
