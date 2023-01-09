//
//  ClassesTests.swift
//  skedTests
//
//  Created by Bill Wake on 1/8/23.
//

import XCTest
@testable import sked

final class ClassesTests : XCTestCase {
  func test_startsEmpty() {
    let classes = Classes()
    XCTAssertEqual(classes.count, 0)
  }
}
