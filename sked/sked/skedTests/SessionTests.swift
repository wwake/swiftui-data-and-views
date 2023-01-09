@testable import sked
import XCTest

final class SessionTests: XCTestCase {

    func test_Comparable() throws {
      XCTAssertLessThan(Session(name: "A", duration: 2), Session(name: "B", duration: 2))

      XCTAssertLessThan(Session(name: "B", duration: 1), Session(name: "B", duration: 2))

      XCTAssertLessThan(Session(name: "A", duration: 1), Session(name: "B", duration: 2))

      XCTAssertGreaterThanOrEqual(Session(name: "C", duration: 1), Session(name: "B", duration: 2))

      XCTAssertGreaterThanOrEqual(Session(name: "A", duration: 2), Session(name: "A", duration: 2))
    }
}
