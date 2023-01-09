//
//  ContentView.swift
//  sked
//
//  Created by Bill Wake on 1/8/23.
//

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


struct ContentView: View {
  @StateObject private var rooms = Rooms()
  @StateObject private var sessions = Sessions()
  
  @State private var showRooms = false
  
  @State private var showSessions = false
  
  @State private var sessionName: String = ""
  @State private var sessionDuration: Int = 1
  
  var body: some View {
    VStack {
      HStack {
        VStack {
          Text("Sessions")
            .font(.title)
          
          List {
            ForEach(sessions.all) {
              Text(verbatim: $0.description)
                .rotationEffect(Angle(degrees: 45), anchor: .bottomLeading)
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
        }
        .frame(width:300)
        
        Divider()
        
        CalendarView(rooms: rooms)
        
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
