//
//  Room.swift
//  sked
//
//  Created by Bill Wake on 1/8/23.
//

import Foundation

public class Room {
  var name: String
  
  init(_ name: String) {
    self.name = name
  }
}

extension Room : Equatable {
  public static func == (lhs: Room, rhs: Room) -> Bool {
    lhs.name == rhs.name
  }
}

extension Room: CustomStringConvertible {
  public var description: String {
    name
  } 
}

extension Room: Comparable {
  public static func < (lhs: Room, rhs: Room) -> Bool {
    lhs.name < rhs.name
  }
}
