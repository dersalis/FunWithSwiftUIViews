//
//  CircleTimeGraphView.swift
//  FunWithSwiftUIViews
//
//  Created by Damian Ruta on 17/11/2020.
//

import SwiftUI

struct CircleTimeGraphView: View {
    @State var totalTimeSec: Int
    @State var currentTimeSec: Int
    @State var isPaused: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
//                RoundedRectangle(cornerRadius: 20.0)
//                    .foregroundColor(Color/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/.opacity(0.3))
                Circle().stroke(lineWidth: 18).frame(width: geo.size.height * 0.8).foregroundColor(Color.black.opacity(0.1))
                Circle().trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: CGFloat((CGFloat(currentTimeSec) / CGFloat(totalTimeSec)))).stroke(style: StrokeStyle(lineWidth: 18, lineCap: .round, lineJoin: .round)).frame(width: geo.size.height * 0.8).rotationEffect(.degrees(-90))
                VStack {
                    HStack (alignment: .bottom) {
                        VStack {
                            Text(calculateTime(currentTime: currentTimeSec)).font(.system(size: geo.size.height * 0.15)).fontWeight(.ultraLight)
                        }
                        Text("min").font(.system(size: geo.size.height * 0.08)).fontWeight(.ultraLight).padding(.bottom, 5)
                    }
                    VStack {
                        if isPaused {
                            Text("Paused").font(.system(size: geo.size.height * 0.065)).fontWeight(.ultraLight)
                        }
                    }.frame(height: geo.size.height * 0.1)
                }
            }
        }
    }
    
    
    func calculateTime(currentTime: Int) -> String {
        let minInt: Int = currentTimeSec / 60
        let secInt: Int = currentTimeSec - (minInt * 60)
        var minStr: String
        var secStr: String
        var timeStr: String
        
        if minInt < 10 {
            minStr = "0" + String(minInt)
        }
        else {
            minStr = String(minInt)
        }
        
        if secInt < 10 {
            secStr = "0" + String(secInt)
        }
        else {
            secStr = String(secInt)
        }
        
        timeStr = minStr + ":" + secStr
        
        return timeStr
    }
}

struct CircleTimeGraphView_Previews: PreviewProvider {
    static var previews: some View {
        CircleTimeGraphView(totalTimeSec: 700, currentTimeSec: 500, isPaused: false)
            .previewLayout(.fixed(width: 200, height: 200))
        CircleTimeGraphView(totalTimeSec: 700, currentTimeSec: 400, isPaused: true)
            .previewLayout(.fixed(width: 200, height: 200))
        CircleTimeGraphView(totalTimeSec: 500, currentTimeSec: 125, isPaused: true)
            .previewLayout(.fixed(width: 300, height: 300))
        CircleTimeGraphView(totalTimeSec: 500, currentTimeSec: 125, isPaused: true)
            .previewLayout(.fixed(width: 400, height: 400))
    }
}
