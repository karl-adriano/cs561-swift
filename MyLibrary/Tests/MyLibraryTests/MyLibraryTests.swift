import XCTest
import MyLibrary
 
final class MyLibraryTests: XCTestCase {
    func testWeather() throws {
        // Given
        let myLibrary = MyLibrary()
        let expectation = XCTestExpectation(description: "We asked about the weather and heard back 🎄")
        var isTemperature: Bool?

        // When
        myLibrary.isWeather(completion: { temp in
            isTemperature = temp
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 5)

        // Then
        XCTAssertNotNil(isTemperature)
        XCTAssert(isTemperature == true)
    }

    func testHello() throws {
        // Given
        let myLibrary = MyLibrary()
        let expectation = XCTestExpectation(description: "We asked about the greeting and heard back 🎄")
        var isHello: Bool?

        // When
        myLibrary.isGreeting(completion: { greeting in
            isHello = greeting
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 5)

        // Then
        XCTAssertNotNil(isHello)
        XCTAssert(isHello == true)
    }
}