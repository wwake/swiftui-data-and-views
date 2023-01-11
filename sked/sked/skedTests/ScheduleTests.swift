@testable import sked
import XCTest

final class ScheduleTests: XCTestCase {

  func test_KnowsTimeslotsDefaultToOpen() {
    let schedule = Schedule()
    let room = Room("ready")
    
    XCTAssertTrue(schedule.isOpen(room, start: 0, duration: 24))
  }
  
  func test_KnowsCreatedSessions() {
    let schedule = Schedule()
    let room = Room("ready")
    let session = Session(name: "Ice cream", duration:2)
    
    schedule.reserve(room, session, start: 1)

    XCTAssertTrue(schedule.isOpen(room, start: 0, duration: 1))
    XCTAssertEqual(schedule[1, room], session)
    XCTAssertEqual(schedule[2, room], session)
    XCTAssertTrue(schedule.isOpen(room, start:3, duration: 21))
  }
  
  func test_WontScheduleIntoBusyRoom() {
    let schedule = Schedule()
    let room = Room("ready")
    let session1 = Session(name: "Ice cream", duration:2)
    schedule.reserve(room, session1, start: 2)
    
    let session2 = Session(name: "Candy", duration: 4)
    schedule.reserve(room, session2, start:0)
    
    XCTAssertTrue(schedule.isOpen(room, start:0, duration:2))
    XCTAssertEqual(schedule[2, room], session1)
  }
  
  func test_IsOpenFalseIfAnyTimeslotIsBusy() {
    let schedule = Schedule()
    let room = Room("ready")
    let session1 = Session(name: "Ice cream", duration:2)
    schedule.reserve(room, session1, start: 2)
    
    let actual = schedule.isOpen(room, start:1, duration:4)
    
    XCTAssertFalse(actual, "isOpen() should yield false when busy at any overlapping time")
  }
}
