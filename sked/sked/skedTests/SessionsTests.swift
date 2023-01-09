//
//  SessionTests.swift
//  skedTests
//
//  Created by Bill Wake on 1/8/23.
//

import XCTest
@testable import sked

final class SessionsTests : XCTestCase {
  func test_startsEmpty() {
    let sessions = Sessions()
    XCTAssertEqual(sessions.count, 0)
  }
  
  func test_oneSession() {
    let sessions = Sessions()
    let session = Session(name: "Only", duration: 2)
    
    sessions.add(session)
    
    XCTAssertEqual(sessions.all, [session])
  }
}
