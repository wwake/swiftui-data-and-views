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
    let classes = Sessions()
    XCTAssertEqual(classes.count, 0)
  }
}
