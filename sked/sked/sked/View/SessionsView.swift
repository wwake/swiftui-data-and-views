//
//  SessionsView.swift
//  sked
//
//  Created by Bill Wake on 1/11/23.
//

import SwiftUI

struct SessionsView: View {
  @ObservedObject var sessions = Sessions()
  
  @State private var sessionName: String = ""
  @State private var sessionDuration: Int = 1
  
  var body: some View {
    Text("Sessions")
      .font(.title)
    
    List { 
      ForEach(sessions.all) {
        Text(verbatim: $0.description)
      }
    }
    
    Form {
      TextField("Session name", text: $sessionName)
      Stepper("Duration (h): \(sessionDuration)", value: $sessionDuration, in:1...23) 
      Button("Add") {
        sessions.add(Session(name: sessionName, duration: sessionDuration))
        sessionName = ""
        sessionDuration = 1
      }
    }
  }
}

