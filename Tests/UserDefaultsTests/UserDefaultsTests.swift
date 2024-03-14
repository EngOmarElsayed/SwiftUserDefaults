import XCTest
import UserDefaults

internal final class UserDefaultsTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    deleteArtifactsFromUserDefaults()
  }
  
  override func tearDown() {
    super.tearDown()
    deleteArtifactsFromUserDefaults()
  }
  
  func test_UserDefaultWrapper_retrievingAfterInitializingValue() {
    let expectedResult = 9
    @UserDefault(key: DefaultKeys.testKey) var testValue = expectedResult
    
    XCTAssertEqual(testValue, expectedResult, "Expected to have the same value")
  }
  
  func test_UserDefaultWrapper_retrievingAfterOverRidingDefaultValue() {
    let expectedResult = 9
    @UserDefault(key: DefaultKeys.testKey) var testValue = 10
    
    testValue = expectedResult
    
    XCTAssertEqual(testValue, expectedResult, "Expected to have the same value")
  }
  
  func test_UserDefaultWrapper_retrievingAfterInitializingNilValue() {
    @UserDefault(key: DefaultKeys.testKey) var testValue: Int?
    
    XCTAssertNil(testValue, "Expected to be nil")
  }
  
  func test_UserDefaultWrapper_retrievingAfterOverRidingNilValue() {
    let expectedResult = 9
    @UserDefault(key: DefaultKeys.testKey) var testValue: Int?
    
    testValue = expectedResult
    
    XCTAssertEqual(testValue, expectedResult, "Expected to have the same value, got nil insted")
  }
  
  func test_UserDefaultWrapper_retrievingCustomDataTypeAfterInitializingValue() {
    let expectedResult = TestCustomType(id: 2)
    @UserDefault(key: DefaultKeys.testKey) var testValue = TestCustomType(id: 5)
    
    testValue = expectedResult
    
    XCTAssertEqual(testValue.id, expectedResult.id, "Expected to have the same value got \(testValue.id)")
  }
  
  private func deleteArtifactsFromUserDefaults() {
    UserDefaults.standard.removeObject(forKey: DefaultKeys.testKey)
  }
  
  private struct TestCustomType: DefaultsCustomDataType {
    let id: Int
  }
  
}

fileprivate extension DefaultKeys {
  static let testKey = "testKey"
}
