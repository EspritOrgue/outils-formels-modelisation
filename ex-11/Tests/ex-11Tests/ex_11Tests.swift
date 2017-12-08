import XCTest
@testable import ex_11

class ex_11Tests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ex_11().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
