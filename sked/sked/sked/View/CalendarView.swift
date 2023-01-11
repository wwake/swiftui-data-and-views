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
  @ObservedObject var schedule: Schedule
      
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
            
            ForEach(rooms.all) { room in 
              if schedule.isOpen(room, start: time, duration: 1) {
                Image(systemName: "square.split.diagonal.2x2")
                  .foregroundColor(.gray)

              } else {
                Image(systemName: "square.fill")
                  .foregroundColor(schedule[time, room].color)
              }
            }
          }
        }
      }
      
      Spacer()
    }
    .padding()
  }
}


