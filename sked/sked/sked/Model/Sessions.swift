//
//  Classes.swift
//  sked
//
//  Created by Bill Wake on 1/8/23.
//

import Foundation

public class Sessions : ObservableObject {
  private var sessions: [Session] = []
  
  public var count: Int {
    sessions.count
  }
  
  public func add(_ session: Session) {
    sessions.append(session)
    sessions.sort()
  }
  
  public var all: [Session] {
    sessions
  }
}
