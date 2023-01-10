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
  @StateObject private var schedule = Schedule(open: Session(name: "", duration: 1))
  
  @State private var showRooms = false
  
  @State private var showSessions = false
  
  @State private var sessionName: String = ""
  @State private var sessionDuration: Int = 1
  
  @State private var showSchedule = false
  
  let colors : [Color] = [.blue, .brown, .cyan, .gray, .green, .pink, .purple, .red, .yellow]
  let colorIndex = 0
  
  var body: some View {
    VStack {
      HStack {
        VStack {
          Text("Sessions")
            .font(.title)
          
          List { 
            ForEach(sessions.all) {
              Text(verbatim: $0.description)
            }
          }
          
          Divider()
          
          Form {
            TextField("Session name", text: $sessionName)
            Stepper("Duration (h): \(sessionDuration)", value: $sessionDuration, in:1...23) 
            Button("Add") {
              sessions.add(Session(name: sessionName, duration: sessionDuration))
              sessionName = ""
              sessionDuration = 1
            }
          }
          
          Divider()
          
          Button("Rooms") {
            showRooms = true
          }
          .sheet(isPresented: $showRooms) {
            RoomsView(rooms: rooms, showRooms: $showRooms)
              .padding()
              .frame(width: 400, height: 500)
          }
          
          Button("Schedule") {
            showSchedule = true
          }
          .sheet(isPresented: $showSchedule) {
            ScheduleView(rooms: rooms, sessions: sessions, schedule: schedule, showSchedule: $showSchedule, selectedSession: sessions.all.first ?? Session(name:"", duration:0), selectedRoom: rooms.all.first ?? Room(""))
              .padding()
              .frame(width: 400, height: 500)
          }
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
