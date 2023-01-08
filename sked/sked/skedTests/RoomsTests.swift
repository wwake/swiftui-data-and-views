@testable import sked
import XCTest

final class RoomsTests: XCTestCase {
  func test_startsEmpty() {
    let rooms = Rooms()
    XCTAssertEqual(rooms.count, 0)
  }
}
