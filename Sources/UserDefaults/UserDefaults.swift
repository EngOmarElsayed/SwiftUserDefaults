//
//  UserDefaults.swift
//
//
//  Created by Eng.Omar Elsayed on 13/03/2024.
//
import Foundation
///
///@UserDefault propertyWrapper used to store data in the userDefaults with easy.
///
@frozen @propertyWrapper
public struct UserDefault<Value: Codable> {
  private let key: String
  private let defaultValue: Value
  private var container: UserDefaults = .standard
  
  public var wrappedValue: Value {
    get {
      return getObject(forKey: key)
    }
    set {
      set(newValue)
    }
  }
  
  public init(wrappedValue: Value, key: String, container: UserDefaults = .standard) {
    self.key = key
    self.defaultValue = wrappedValue
    self.container = container
  }
  
}

extension UserDefault where Value: ExpressibleByNilLiteral {
  public init(key: String, _ container: UserDefaults = .standard) {
    self.init(wrappedValue: nil, key: key, container: container)
  }
}

//MARK: -  Set & Get of the UserDefault values
extension UserDefault {
  private func getObject(forKey: String) -> Value {
    let data = container.object(forKey: key)
    
    if let data = data as? Data {
      return decode(data) ?? defaultValue
    } else {
      return data as? Value ?? defaultValue
    }
  }
  
  private func set(_ newValue: Value) {
    if let optional = newValue as? AnyOptional, optional.isNil {
      container.removeObject(forKey: key)
      
    } else if let newValue = newValue as? DefaultsCustomDataType {
      encode(newValue: newValue)
      
    } else {
      container.set(newValue, forKey: key)
    }
  }
}

//MARK: -  Decoding & Encoding
extension UserDefault {
  private func encode(newValue: DefaultsCustomDataType) {
    let encoder = JSONEncoder()
    let data = try? encoder.encode(newValue)
    container.set(data, forKey: key)
  }
  
  private func decode(_ data: Data) -> Value? {
    let decoder = JSONDecoder()
    let data = try? decoder.decode(Value.self, from: data)
    return data
  }
}
