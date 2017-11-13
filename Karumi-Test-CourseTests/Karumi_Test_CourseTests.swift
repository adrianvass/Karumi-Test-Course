//
//  Karumi_Test_CourseTests.swift
//  Karumi-Test-CourseTests
//
//  Created by VASS on 13/11/2017.
//

import XCTest
@testable import Karumi_Test_Course

class KataStringCalulatorTests: XCTestCase {
    let stringCalculator = KataStringCalculator()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCalculatorShouldReturnZeroOnAnEmptyString() {
        XCTAssertEqual(0, try! stringCalculator.sum(""))
    }
    
    func testCalculatorShouldReturnNumberWhenWeOnlySumOneNumber() {
        XCTAssertEqual(1, try! stringCalculator.sum("1"))
    }
    
    func testCalculateSumWhenGivenTwoParamsSeparatedByComa() {
        XCTAssertEqual(3, try! stringCalculator.sum("1,2"))
    }
    
    func testCalculateSumWhenGivenMultipleNumbersSeparatedByComa() {
        XCTAssertEqual(21, try! stringCalculator.sum("1,2,3,4,5,6"))
    }
    
    func testCalculateSumWhenGivenNumbersAreAlsoSeparatedBynewLines() {
        XCTAssertEqual(21, try! stringCalculator.sum("1,2\n3,4,5\n6"))
    }
    
    func testCalculatorSumWhenGivenNegativeNumbersThrowsExceptionWithInvalidNumbers() {
        do {
            let _ = try stringCalculator.sum("-1,-2\n3,4,5\n6")
            XCTFail()
        } catch CalculatorError.negativeNumbersFound(let expectation)  {
            XCTAssertEqual("-1,-2", expectation)
        } catch {
            XCTFail()
        }
    }
}
