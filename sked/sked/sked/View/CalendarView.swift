//
//  CalendarView.swift
//  sked
//
//  Created by Bill Wake on 1/9/23.
//

import Foundation
import SwiftUI

struct CalendarView: View {
  @ObservedObject var rooms : Rooms
  
  var body: some View {
    VStack {
      Text("Schedule")
        .font(.title)
      
      Spacer()
        .frame(height:32)
      
      Grid(alignment: .topLeading) {
        GridRow {
          Text("Time")
            .font(.title3)
            .rotationEffect(Angle(degrees: -60), anchor: .bottomLeading)
          
          ForEach(rooms.all) {
            Text($0.description)
              .rotationEffect(Angle(degrees: -60), anchor: .bottomLeading)
            
          }
        }
        .bold()        
        
        ForEach(0..<24) { time in
          GridRow {
            Text("\(time)")
              .font(.title2)
              .bold()
            
            ForEach(rooms.all) { _ in 
              Text("?")
            }
          }
        }
      }
      
      Spacer()
    }
    .padding()
  }
}


