//
//  ContentView.swift
//  sked
//
//  Created by Bill Wake on 1/8/23.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var rooms = Rooms()
  
  @State private var showRooms = false
  
  @State private var roomName: String = ""
  
  var body: some View {
    VStack {
      Button("Rooms") {
        showRooms = true
      }
      .sheet(isPresented: $showRooms) {
        VStack {
          Text("Rooms")
            .font(.title)
          
          HStack {
            TextField("New room name", text: $roomName)
              .onSubmit {
                print("submitted \(roomName)")
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
            ForEach(rooms.all, id:\.description) {
              Text(verbatim: $0.description)
            }
            .onDelete { indexSet in }
          }
          
          Button("Done") {
            showRooms = false
          }
        }
        .padding()
        .frame(width: 400, height: 500)
      }
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("Hello, world!")
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
