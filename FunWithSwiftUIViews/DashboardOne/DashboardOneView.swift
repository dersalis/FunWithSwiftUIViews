//
//  DashboardOneView.swift
//  FunWithSwiftUIViews
//
//  Created by Damian Ruta on 18/11/2020.
//

import SwiftUI

struct DashboardOneView: View {
    @State var index: Int = 0
    
    
    var body: some View {
        VStack {
            HStack {
                Text("STAT")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }
            .padding(.horizontal)
            
            HStack(spacing: 0) {
                Text("Dzień")
                    .font(.caption)
                    .foregroundColor(self.index == 0 ? Color.white : Color.blue)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.vertical, 10).padding(.horizontal, 35)
                    .background(Color.blue.opacity(self.index == 0 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 0
                        }
                    }
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                Text("Tydzień")
                    .font(.caption)
                    .foregroundColor(self.index == 1 ? Color.white : Color.blue)
                    .fontWeight(.bold).padding(.vertical, 10).padding(.horizontal, 35)
                    .background(Color.blue.opacity(self.index == 1 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 1
                        }
                    }
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                Text("Miesiąc")
                    .font(.caption)
                    .foregroundColor(self.index == 2 ? Color.white : Color.blue)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.vertical, 10).padding(.horizontal, 35)
                    .background(Color.blue.opacity(self.index == 2 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 2
                        }
                    }
                
            }
            .background(Color.black.opacity(0.06))
            .clipShape(Capsule())
            .padding(.horizontal).padding(.top, 25)
            
            TabView (selection: self.$index) {
                GridView(fitnesData: fit_Data)
                    .tag(0)
                GridView(fitnesData: week_Fit_Data)
                    .tag(1)
                VStack {
                    Text("Dane z miesiąca")
                }
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
        }
        .padding(.top)
        
    }
}


struct GridView: View {
    var fitnesData: [Fitness]
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 30) {
            ForEach(fitnesData) { fitnes in
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text(fitnes.title)
                            .foregroundColor(.white)
                        Text(fitnes.data)
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                        
                        HStack {
                            Spacer(minLength:  0)
                            Text(fitnes.suggest)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0 , y: 5)
                    
                    Image(systemName: "heart.fill")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.15))
                        .clipShape(Circle())
                }
            }
        }
        .padding(.top, 25)
        .padding(.horizontal)
    }
}


struct DashboardOneView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardOneView()
    }
}


struct Fitness: Identifiable {
    var id: Int
    var title: String
    var image: String
    var data: String
    var suggest: String
}


// Daily Data...

var fit_Data = [
    Fitness(id: 0, title: "Heart Rate", image: "heart", data: "124 bpm", suggest: "80-120 \nHealthy"),
    Fitness(id: 1, title: "Sleep", image: "sleep", data: "6h 43m", suggest: "Deep Sleep \n5h 13m"),
    Fitness(id: 2, title: "Energy Burn", image: "energy", data: "583 kcal", suggest: "Daily Goal \n900 kcal"),
    Fitness(id: 3, title: "Steps", image: "steps", data: "16,741", suggest: "Daily Goal \n20,000 Steps"),
    Fitness(id: 4, title: "Running", image: "running", data: "5.3 km", suggest: "Daily Goal \n10 km"),
    Fitness(id: 5, title: "Cycling", image: "cycle", data: "15.3 km", suggest: "Daily Goal \n20 km"),
]

// Monthly Data...

var week_Fit_Data = [
    Fitness(id: 0, title: "Heart Rate", image: "heart", data: "84 bpm", suggest: "80-120 \nHealthy"),
    Fitness(id: 1, title: "Sleep", image: "sleep", data: "43h 23m", suggest: "Deep Sleep \n26h 13m"),
    Fitness(id: 2, title: "Energy Burn", image: "energy", data: "3,500 kcal", suggest: "Weekly Goal \n4,800 kcal"),
    Fitness(id: 3, title: "Steps", image: "steps", data: "17,8741", suggest: "Weekly Goal \n25,0000 Steps"),
    Fitness(id: 4, title: "Running", image: "running", data: "45.3 km", suggest: "Weekly Goal \n70 km"),
    Fitness(id: 5, title: "Cycling", image: "cycle", data: "100.3 km", suggest: "Weekly Goal \n125 km"),
]
