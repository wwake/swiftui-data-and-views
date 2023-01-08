//
//  Rooms.swift
//  sked
//
//  Created by Bill Wake on 1/8/23.
//

import Foundation

public class Rooms {
  private var rooms: [Room] = []
  
  public var count: Int { 0 }
  
  public func add(_ room: Room) {
    rooms.append(room)
  }
  
  public var all: [Room] {
    rooms.sorted()
  }
}
