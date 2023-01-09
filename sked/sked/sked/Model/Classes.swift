//
//  Classes.swift
//  sked
//
//  Created by Bill Wake on 1/8/23.
//

import Foundation

public class Session {}

public class Classes : ObservableObject {
  private var classes: [Session] = []
  
  public var count: Int {
    classes.count
  }
}
