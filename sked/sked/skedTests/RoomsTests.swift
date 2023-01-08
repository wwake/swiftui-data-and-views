@testable import sked
import XCTest

final class RoomsTests: XCTestCase {
  func test_startsEmpty() {
    let rooms = Rooms()
    XCTAssertEqual(rooms.count, 0)
  }
  
  func test_oneRoom() {
    let rooms = Rooms()
    let room = Room("elbow")
    
    rooms.add(room)
    
    XCTAssertEqual(rooms.all, [room])
  }
}
