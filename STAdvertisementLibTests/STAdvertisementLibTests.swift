//
//  STAdvertisementLibTests.swift
//  STAdvertisementLibTests
//
//  Created by ShareTrip iOS on 28/4/21.
//

import XCTest
@testable import STAdvertisementLib

class STAdvertisementLibTests: XCTestCase {
    
    var swiftyLib: SwiftyLib!
    
    override func setUp() {
        swiftyLib = SwiftyLib()
    }
    
    func testAdd() {
        XCTAssertEqual(swiftyLib.add(a: 1, b: 1), 2)
    }
    
    func testSub() {
        XCTAssertEqual(swiftyLib.sub(a: 2, b: 1), 1)
    }
    
}
