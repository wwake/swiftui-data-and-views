//
//  Rooms.swift
//  sked
//
//  Created by Bill Wake on 1/8/23.
//

import Foundation

public class Rooms : ObservableObject {
  private var rooms: [Room] = []
  
  public var count: Int { 0 }
  
  public func add(_ room: Room) {
    guard !rooms.contains(room) else {return}
    rooms.append(room)
    rooms.sort()
  }
  
  public var all: [Room] {
    rooms
  }
}
