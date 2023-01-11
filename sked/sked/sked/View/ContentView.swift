//
//  ContentView.swift
//  sked
//
//  Created by Bill Wake on 1/8/23.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var rooms = Rooms()
  @StateObject private var sessions = Sessions()
  @StateObject private var schedule = Schedule()
  
  @State private var showRooms = false
  
  var body: some View {
    VStack {
      HStack {
        VStack {
          Text("Rooms")
            .font(.title)
          
          Button("Rooms") {
            showRooms = true
          }
          .sheet(isPresented: $showRooms) {
            RoomsView(rooms: rooms, showRooms: $showRooms)
              .padding()
              .frame(width: 400, height: 500)
          }
          
          Divider()
          
          SessionsView(sessions: sessions)
          
          Divider()
          
          ScheduleView(rooms: rooms, sessions: sessions, schedule: schedule, selectedSession: sessions.all.first ?? Session(name:"(none available)", duration:0), selectedRoom: rooms.all.first ?? Room("(none available)"))

        }
        .frame(width:300)
        
        Divider()
        
        CalendarView(rooms: rooms, schedule: schedule)
        
        Spacer()
      }  
      Spacer()
    }
    .frame(width:800, height:600)
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
