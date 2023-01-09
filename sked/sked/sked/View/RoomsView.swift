//
//  RoomsView.swift
//  sked
//
//  Created by Bill Wake on 1/8/23.
//

import Foundation
import SwiftUI

struct RoomsView: View {
  @ObservedObject var rooms : Rooms
  @Binding var showRooms: Bool
  @State private var roomName: String = ""
  
  var body: some View {
    VStack {
      Text("Rooms")
        .font(.title)
      
      HStack {
        TextField("New room name", text: $roomName)
          .onSubmit {
            rooms.add(Room(roomName))
            roomName = ""
          }
        
        Button(action: {
          rooms.add(Room(roomName))
          roomName = ""
        }) {
          Text("Add")
        }
      }
      List {
        ForEach(rooms.all) {
          Text(verbatim: $0.description)
        }
        .onDelete { indexSet in }
      }
      
      Button("Done") {
        showRooms = false
      }
    }
  }
}

