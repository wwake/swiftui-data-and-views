//
//  Schedule.swift
//  sked
//
//  Created by Bill Wake on 1/8/23.
//

import Foundation

public class Schedule : ObservableObject {
  let open: Session
  
  @Published var sessions: [[Room : Session]] = Array(repeating: [:], count: 24)
  
  public init(open: Session) {
    self.open = open
  }
  
  public subscript(index: Int, room: Room) -> Session {
    if index < 0 || index >= sessions.count {
      return open
    }
    return sessions[index][room] ?? open
  }
  
  public func isOpen(_ room: Room, start: Int, duration: Int) -> Bool {
    for time in start..<(start + duration) {
      if self[time, room] != open { return false }
    }
    return true
  }
  
  public func reserve(_ room: Room, _ session: Session, start: Int) {
    if !isOpen(room, start: start, duration: session.duration) { return }
    for timeslot in start..<(start + session.duration) {
      sessions[timeslot][room] = session
    }
  }
}
