//
//  PeopleViewModelTests.swift
//  PeoplesManagementTests
//
//  Created by Suguru Tokuda on 11/10/23.
//

import XCTest
@testable import PeoplesManagement

@MainActor
final class PeopleViewModelTests: XCTestCase {
    var vm: PeopleViewModel!

    override func setUpWithError() throws {
        // given
        vm = PeopleViewModel(manager: FakeNetworkManager())
    }

    override func tearDownWithError() throws {
        vm = nil
    }
    
    func testGetDataFromViewModel_whenWeAreExpectingGoodResults() async throws {
        await vm.getDataFromViewModel(urlString: "PeoplesList")
        
        // then
        XCTAssertEqual(vm.people.count, 94)
        
        let person: People? = vm.people.first
        
        XCTAssertEqual(person?.firstName, "Maggie")
        XCTAssertEqual(person?.lastName, "Brekke")
        XCTAssertEqual(person?.email, "Crystel.Nicolas61@hotmail.com")
        XCTAssertEqual(person?.jobTitle, "Future Functionality Strategist")
        XCTAssertEqual(person?.favouriteColor, "pink")
        XCTAssertEqual(person?.createdAt, "2022-01-24T17:02:23.729Z")
        XCTAssertNil(vm.customError)
    }
    
    func testGetDataFromViewModel_whenWeAreExpecting_NoData_whenWeDontPassURL() async throws {
        // when
        await vm.getDataFromViewModel(urlString: "")
        
        // then
        XCTAssertEqual(vm.people.count, 0)
        XCTAssertNotNil(vm.customError)
        XCTAssertEqual(vm.customError, .badUrl)
    }
    
    func testGetDataFromViewModel_whenWeAreExpecting_NoData_whenWrongURL() async throws {
        // when
        await vm.getDataFromViewModel(urlString: "afdadgafjldsafadjslg")
        
        // then
        XCTAssertEqual(vm.people.count, 0)
        XCTAssertNotNil(vm.customError)
        XCTAssertEqual(vm.customError, .badUrl)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
