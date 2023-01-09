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
  
  var body: some View {
    VStack {
      Button("Rooms") {
        showRooms = true
      }
      .sheet(isPresented: $showRooms) {
        RoomsView(rooms: rooms, showRooms: $showRooms)
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
