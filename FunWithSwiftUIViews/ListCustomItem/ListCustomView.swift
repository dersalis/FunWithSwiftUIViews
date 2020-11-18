//
//  ListCustomView.swift
//  FunWithSwiftUIViews
//
//  Created by Damian Ruta on 17/11/2020.
//

import SwiftUI

struct ListCustomView: View {
    @ObservedObject var trailsStorage = TrailStorage()
    @State var name: String = ""
    @State var location: String = ""
    @State var distance: String = ""
    
    var body: some View {
        VStack {
            addTrail
            Divider()
            List {
                ForEach(trailsStorage.trails) { trail in
                    TrailRowView(trail: trail)
                }.onMove(perform: self.move)
                .onDelete(perform: self.delete)
            }
        }
    }
    
    var addTrail: some View {
        VStack {
            HStack {
                Text("Nazwa")
                    .foregroundColor(Color.gray)
                TextField("", text: self.$name)
            }
            HStack {
                Text("Lokalizacja").foregroundColor(Color.gray)
                TextField("", text: self.$location)
            }
            HStack {
                Text("Dystans").foregroundColor(Color.gray)
                TextField("", text: self.$distance)
            }
            HStack {
                Button("Dodaj", action: self.add)
                Spacer()
                EditButton()
            }
            .padding(.top, 10)
        }.padding()
    }
    
    func add () -> Void {
        let newTrail = Trail(name: self.name, location: self.location, distance: Double(self.distance) ?? 0.0)
        self.trailsStorage.trails.append(newTrail)
        self.name = ""
        self.location = ""
        self.distance = ""
    }
    
    func move(from source: IndexSet, to destination: Int) {
        trailsStorage.trails.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offset: IndexSet) {
        trailsStorage.trails.remove(atOffsets: offset)
    }
}


struct ListCustomView_Previews: PreviewProvider {
    static var previews: some View {
        ListCustomView()
    }
}
