//
//  Classes.swift
//  sked
//
//  Created by Bill Wake on 1/8/23.
//

import Foundation

public class Sessions : ObservableObject {
  @Published public var all: [Session] = []
  
  public var count: Int {
    all.count
  }
  
  public func add(_ session: Session) {
    all.append(session)
    all.sort()
  }
}
