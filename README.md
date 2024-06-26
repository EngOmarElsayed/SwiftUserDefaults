# SwiftUserDefaults
![example workflow](https://github.com/EngOmarElsayed/SwiftUserDefaults/actions/workflows/swift.yml/badge.svg)
![GitHub License](https://img.shields.io/github/license/EngOmarElsayed/SwiftUserDefaults)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FEngOmarElsayed%2FSwiftUserDefaults%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/EngOmarElsayed/SwiftUserDefaults)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FEngOmarElsayed%2FSwiftUserDefaults%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/EngOmarElsayed/SwiftUserDefaults)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](#swift-package-manager)

## Table of Contents
1. [Introduction](#introduction)
2. [How to use](#section-1)
   - [Custome Container](#sub-topic-1.1)
   - [Supported Data](#sub-topic-1.2)
3. [Storing Custome Data](#section-2)
   - [Example 1 Enums](#sub-topic-2.1)
   - [Example 2 Custom Array type](#sub-topic-2.2)
4. [RemovingStoredObjects](#section-3) 
5. [Author](#conclusion)

## Introduction <a name="introduction"></a>
This package is crafted for effortless integration and streamlined access to user defaults plus it supports the new privacy rules from WWDC23. Adding it to your project is straightforward: simply include the package link in the main app package like this:"

<img width="600" alt="Screenshot 2024-03-15 at 3 28 47 AM" src="https://github.com/EngOmarElsayed/SwiftUserDefaults/assets/125718818/749fcc36-13c9-4b04-84b8-c93893162a3d">

Alternatively, navigate to the top section labeled 'Files' and click on 'Add Package Dependency':

<img width="300" alt="Screenshot 2024-03-15 at 3 33 08 AM" src="https://github.com/EngOmarElsayed/SwiftUserDefaults/assets/125718818/835a99dc-6ed3-4e35-9ed2-4458ec6935de">

Next, paste the repository link into the search field and click on 'Add Package':

<img width="300" alt="Screenshot 2024-03-15 at 3 34 52 AM" src="https://github.com/EngOmarElsayed/SwiftUserDefaults/assets/125718818/2d5ba858-9e78-4517-a233-85fb936fd4a1">

## How to use <a name="section-1"></a>
Utilizing this API is designed to be straightforward and as effortless as using the `@AppStorage` API But with more features. First this API is compile time safe and prevents any string typos. Simply declare your key in the `DefaultKeys` and then add the `@UserDefaults` to your `varible` as follows - that's all there is to it

```swift
@UserDefaults(\.previewShown) var previewShown = false // false is the default value
```

```swift
extension DefaultKeys {
   var previewShown: String { .init("previewShown") }
}
```

> [!NOTE]  
> You can also store optional values just like that:
> ```swift
> @UserDefaults(\.previewShown) var previewShown: Bool?
> ```

### Custome Container <a name="sub-topic-1.1"></a>
You can also store your userDefaults in a custome `container` like so: 
```swift
@UserDefaults(\.previewShown, .init(suiteName: "YourCustomeContainerName")) var previewShown = false
```
### Supported Data <a name="sub-topic-1.2"></a>
SwiftUserDefaults supports all of the standard `NSUserDefaults` types, like `String`, `Int`, `Bool`, `Array` and much more.

Here's a full table of built-in single value defaults:

| Single value     | Array                |
| ---------------- | -------------------- |
| `String`         | `[String]`           |
| `Int`            | `[Int]`              |
| `Double`         | `[Double]`           |
| `Bool`           | `[Bool]`             |
| `Data`           | `[Data]`             |
| `Date`           | `[Date]`             |
| `URL`            | `[URL]`              |
| `[String: Any]`  | `[[String: Any]]`    |

But you can also support custome data types 🚀

## Storing Custome Data <a name="section-2"></a>
Storing custom data types is straightforward; you only need to ensure that the custom data type conforms to `DefaultsCustomDataType`, as demonstrated below:

```swift
struct CustomeData: DefaultsCustomDataType {
 init()
}
@UserDefaults(\.customeData) var customeData = CustomeData()
```

`DefaultsCustomDataType` is a `public` `protocol` that conforms to the `Codable` protocol. It serves as a bridge, allowing the API to easily detect whether this data type needs to be encoded or not.

### Example 1 Enums <a name="sub-topic-2.1"></a>
Storing an `Enum` is straightforward; simply ensure that the `Enum` conforms to `DefaultsCustomDataType`, as shown below:

```swift
enum CustomeData: DefaultsCustomDataType {
case none
}
@UserDefaults(\.customeData) var customeData: CustomeData = .none
```
### Example 2 Custom Array type <a name="sub-topic-2.2"></a>
Storing custom `Array` types is even simpler just ensure that the `Element` type of the `Array` conforms to `DefaultsCustomDataType`, as demonstrated below:

```swift
struct CustomeData: DefaultsCustomDataType {
init()
}
@UserDefaults(\.customeData) var customeData: [CustomeData] = [CustomeData()]
```

## RemovingStoredObjects <a name="section-3"></a>
You can also remove the stored value for a specific key using the `DefaultKeys.removeObject(at keyPath: KeyPath<DefaultKeys, String>, _ container: UserDefaults = .standard)`, as demonstrated below:

```swift
@UserDefaults(\.testKey) var test = 3
DefaultKeys.removeObject(\.testKey)
// if you use a custome container provide it to the funcation using this syntax, 
// DefaultKeys.removeObject(at keyPath: KeyPath<DefaultKeys, String>, _ container: UserDefaults = .standard)
```

> [!NOTE]  
> When you call `test` after removing the stored value, it will give the default value which is equal `3` in this case (which is not stored UserDefaults2 store).
> if it was an `optional` the output will be `nil` in this case.

if you want to delete all the values in the UserDefaults, you can use `DefaultKeys.removeAllUserDefaultsObjects(for container: UserDefaults = .standard)`:

```swift
@UserDefaults(\.testKey) var test = 3
DefaultKeys.removeAllUserDefaultsObjects()
// if you use a custome container provide it to the funcation using this syntax, 
// DefaultKeys.removeAllUserDefaultsObjects(for container: UserDefaults = .standard)
```

And that's all there is to it! 🚀 Enjoy using this Swifty package.

## Author <a name="conclusion"></a>
This pacakge was created by [Eng.Omar Elsayed](https://www.deveagency.com/) to help the iOS comuntity and make there life easir. To contact me email me at eng.omar.elsayed@hotmail.com

