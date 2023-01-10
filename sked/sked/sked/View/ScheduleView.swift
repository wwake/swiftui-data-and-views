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
  @Binding var showSchedule: Bool
  
  @State var selectedSession : Session
  @State var selectedRoom: Room
  @State var timeSlot = 0
  
  var body: some View {
    Text("Schedule")
      .font(.title)
    
    Text(verbatim: "\(selectedSession)")
    Text(verbatim: "\(selectedRoom)")
    
    Form {
      Picker("Session", selection: $selectedSession) {
        ForEach(sessions.all, id:\.self) {
          Text(verbatim: "\($0)")
            .padding()
        }
      }
      
      Picker("Room", selection: $selectedRoom) {
        ForEach(rooms.all, id:\.self) {
          Text(verbatim: "\($0)")
        } 
      } 
      
      Stepper("Time (h): \(timeSlot)", value: $timeSlot, in:0...23) 
      
      Button("Schedule") {}
      
    }
    
    Spacer()
    
    Button("Done") {
      showSchedule = false
    }
    Spacer()
  }
}


