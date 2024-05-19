//Copyright (c) 2024 Eng.Omar Elsayed
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

import XCTest
import UserDefaults

internal final class UserDefaultsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        deleteArtifactsFromUserDefaults(for: \.testKey)
    }
    
    override func tearDown() {
        super.tearDown()
        deleteArtifactsFromUserDefaults(for: \.testKey)
    }
    
    func test_UserDefaultWrapper_retrievingAfterInitializingValue() {
        let expectedResult = 9
        @UserDefault(\.testKey) var testValue = expectedResult
        
        XCTAssertEqual(testValue, expectedResult, "Expected to have the same value")
    }
    
    func test_UserDefaultWrapper_retrievingAfterOverRidingDefaultValue() {
        let expectedResult = 9
        @UserDefault(\.testKey) var testValue = 10
        
        testValue = expectedResult
        
        XCTAssertEqual(testValue, expectedResult, "Expected to have the same value")
    }
    
    func test_UserDefaultWrapper_retrievingAfterInitializingNilValue() {
        @UserDefault(\.testKey) var testValue: Int?
        
        XCTAssertNil(testValue, "Expected to be nil")
    }
    
    func test_UserDefaultWrapper_retrievingAfterOverRidingNilValue() {
        let expectedResult = 9
        @UserDefault(\.testKey) var testValue: Int?
        
        testValue = expectedResult
        
        XCTAssertEqual(testValue, expectedResult, "Expected to have the same value, got nil insted")
    }
    
    func test_UserDefaultWrapper_retrievingCustomDataTypeAfterInitializingValue() {
        let expectedResult = TestCustomType(id: 2)
        @UserDefault(\.testKey) var testValue = TestCustomType(id: 5)
        
        testValue = expectedResult
        
        XCTAssertEqual(testValue.id, expectedResult.id, "Expected to have the same value got \(testValue.id)")
    }
    
    func test_UserDefaultWrapper_retrievingDataTypeAfterInitializingValue() {
        let expectedResult = Data()
        @UserDefault(\.testKey) var testValue = Data()
        
        testValue = expectedResult
        
        XCTAssertEqual(testValue, expectedResult, "Expected to have the same value got \(testValue)")
    }
    
    private func deleteArtifactsFromUserDefaults(for key: KeyPath<DefaultKeys, String>) {
        UserDefaults.standard.removeObject(forKey: DefaultKeys[key])
    }
    
    private struct TestCustomType: DefaultsCustomDataType {
        let id: Int
    }
    
}

fileprivate extension DefaultKeys {
    var testKey: String {
        .init("testKey")
    }
}
