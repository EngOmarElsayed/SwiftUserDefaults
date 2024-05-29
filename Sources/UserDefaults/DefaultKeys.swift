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
/// This is the place where all the keys will be stored. To add a new key, just make an extension and declare a new static String value
@frozen
public struct DefaultKeys {
    /// This is used to access the keys using the static subscript.
    private static let current = DefaultKeys()
    
    /// This subscript is used to access the stored keys
    public static subscript(_ key: KeyPath<DefaultKeys, String>) -> String {
        return current[keyPath: key]
    }
}

//MARK: -  Removing Stored Objects
extension DefaultKeys {
    /// Clears all the objects stored in the specified container. By default it uses the ``.standard`` container.
    ///
    /// When you call the variable after removing it, you will get the default value you provided or nil if it was optional.
    public static func removeAllUserDefaultsObjects(for container: UserDefaults = .standard) {
        if let domainName = Bundle.main.bundleIdentifier {
            container.removePersistentDomain(forName: domainName)
            container.synchronize()
        }
    }
    
    /// Removes the Value at the specified keyPath.
    ///
    /// When you call the variable after removing it, you will get the default value you provided or nil if it was optional.
    public static func removeObject(at keyPath: KeyPath<DefaultKeys, String>, _ container: UserDefaults = .standard) {
        container.removeObject(forKey: DefaultKeys[keyPath])
    }
}
