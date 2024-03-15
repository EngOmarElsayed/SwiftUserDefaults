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
