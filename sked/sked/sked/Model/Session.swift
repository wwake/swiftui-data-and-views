//
//  Session.swift
//  sked
//
//  Created by Bill Wake on 1/8/23.
//

import SwiftUI

public class Session : Identifiable {
  public let id = UUID()
  var name: String
  var duration: Int
  var color: Color
  
  init(name: String, duration: Int) {
    self.name = name
    self.duration = duration
    
    self.color = Color(
      red: .random(in: 0...1),
      green: .random(in: 0...1),
      blue: .random(in: 0...1)) 
  }
}

extension Session : Equatable {
  public static func == (lhs: Session, rhs: Session) -> Bool {
    lhs.id == rhs.id
  }
}

extension Session: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}

extension Session: Comparable {
  public static func < (lhs: Session, rhs: Session) -> Bool {
    lhs.name < rhs.name
    || ( lhs.name == rhs.name && 
    lhs.duration < rhs.duration)
  }
}

extension Session : CustomStringConvertible {
  public var description: String {
    "\(name) - \(duration)h"
  }
}
