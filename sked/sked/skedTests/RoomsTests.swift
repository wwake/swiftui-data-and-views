@testable import sked
import XCTest

final class RoomsTests: XCTestCase {
  func test_startsEmpty() {
    let rooms = Rooms()
    XCTAssertEqual(rooms.all, [])
  }
  
  func test_oneRoom() {
    let rooms = Rooms()
    let room = Room("elbow")
    
    rooms.add(room)
    
    XCTAssertEqual(rooms.all, [room])
  }
  
  func test_noDuplicateRooms() {
    let rooms = Rooms()
    let room1 = Room("elbow")
    let room2 = Room("elbow")
    
    rooms.add(room1)
    rooms.add(room2)
    
    XCTAssertEqual(rooms.all, [room1])
  }
  
  func test_roomsSortedByName() {
    let rooms = Rooms()
    let room1 = Room("standing")
    let room2 = Room("take-up")
    let room3 = Room("leg")
    
    rooms.add(room1)
    rooms.add(room2)
    rooms.add(room3)
    
    XCTAssertEqual(rooms.all, [room3, room1, room2])
  }
}
