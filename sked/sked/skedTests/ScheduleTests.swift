@testable import sked
import XCTest

final class ScheduleTests: XCTestCase {

  func test_KnowsDefaultOpenSession() {
    let open = Session(name: "Open", duration: 1)
    let schedule = Schedule(open: open)
    let room = Room("ready")
    
    XCTAssertEqual(schedule[0, room], open)
  }
  
  func test_KnowsCreatedSessions() {
    let open = Session(name: "Open", duration: 1)
    let schedule = Schedule(open: open)
    let room = Room("ready")
    let session = Session(name: "Ice cream", duration:2)
    
    schedule.reserve(room, session, start: 1)
    
    XCTAssertEqual(schedule[0, room], open)
    XCTAssertEqual(schedule[1, room], session)
    XCTAssertEqual(schedule[2, room], session)
    XCTAssertEqual(schedule[3, room], open)
  }
}
