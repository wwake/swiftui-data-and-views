//
//  ContentView.swift
//  sked
//
//  Created by Bill Wake on 1/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
          Button("Rooms") {
            print("clicked")
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
