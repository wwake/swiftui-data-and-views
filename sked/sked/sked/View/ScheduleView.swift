//
//  ScheduleView.swift
//  sked
//
//  Created by Bill Wake on 1/9/23.
//

import Foundation
import SwiftUI

struct ScheduleView : View {
  @ObservedObject var rooms : Rooms
  @ObservedObject var sessions : Sessions
  @ObservedObject var schedule : Schedule
  
  @State var selectedSession : Session
  @State var selectedRoom: Room
  @State var selectedTime = 0
  
  var body: some View {
    Text("Schedule")
      .font(.title)
    
    Form {
      Picker("Session", selection: $selectedSession) {
        ForEach(sessions.all, id:\.self) {
          Text(verbatim: "\($0)")
            .padding()
        }
      }
      .disabled(sessions.count == 0)
      .onChange(of: sessions.count) { newCount in 
        if newCount == 1 { 
          selectedSession = sessions.all.first! 
        }
      }
      
      Picker("Room", selection: $selectedRoom) {
        ForEach(rooms.all, id:\.self) {
          Text(verbatim: "\($0)")
        } 
      } 
      .disabled(rooms.count == 0)
      .onChange(of: rooms.count) { newCount in 
        if newCount == 1 { 
          selectedRoom = rooms.all.first! 
        }
      }

      Picker("Time (h)", selection: $selectedTime) {
        ForEach(0..<24) {
          Text(verbatim: "\($0)")
        }
      }
      
      Button("Schedule") {
        schedule.reserve(selectedRoom, selectedSession, start: selectedTime)
      }
      .disabled(rooms.count == 0 || sessions.count == 0)
      
    }
  }
}


