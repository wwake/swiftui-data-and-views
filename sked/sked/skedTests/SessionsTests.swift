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
  
  func test_sessionsListSortedByNameThenDuration() {
    let sessions = Sessions()
    let session1 = Session(name: "B", duration: 2)
    let session2 = Session(name:"B", duration:1)
    let session3 = Session(name: "C", duration:2)
    let session4 = Session(name: "A", duration: 3)
    
    sessions.add(session1)
    sessions.add(session2)
    sessions.add(session3)
    sessions.add(session4)
    
    XCTAssertEqual(sessions.all, [session4, session2, session1, session3])
  }
  
  func testSessionsGetDifferentColors() {
    let session1 = Session(name: "A", duration: 2)
    let session2 = Session(name:"B", duration:1)
    XCTAssertNotEqual(session1.color, session2.color)
  }
}
