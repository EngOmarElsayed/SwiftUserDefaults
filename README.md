# SwiftUserDefaults
![example workflow](https://github.com/EngOmarElsayed/SwiftUserDefaults/actions/workflows/swift.yml/badge.svg)
![GitHub License](https://img.shields.io/github/license/EngOmarElsayed/SwiftUserDefaults)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](#swift-package-manager)
![Swift version](https://img.shields.io/badge/swift-5.7-orange.svg)
![Swift version](https://img.shields.io/badge/swift-5.9-orange.svg)
![Platforms](https://img.shields.io/badge/platforms-ios%20%7C%20osx%20%7C%20watchos%20%7C%20tvos-lightgrey.svg)

## Table of Contents
1. [Introduction](#introduction)
2. [How to use](#section-1)
   - [Custome Container](#sub-topic-1.1)
   - [Supported Data](#sub-topic-1.2)
4. [Storing Custome Data](#section-2)
   - [Example 1 Enums](#sub-topic-2.1)
   - [Example 2 Custom Array type](#sub-topic-2.2)
5. [Author](#conclusion)

## Introduction <a name="introduction"></a>
This package is crafted for effortless integration and streamlined access to user defaults. Adding it to your project is straightforward: simply include the package link in the main app package like this:"

<img width="600" alt="Screenshot 2024-03-15 at 3 28 47 AM" src="https://github.com/EngOmarElsayed/SwiftUserDefaults/assets/125718818/749fcc36-13c9-4b04-84b8-c93893162a3d">

Alternatively, navigate to the top section labeled 'Files' and click on 'Add Package Dependency':

<img width="300" alt="Screenshot 2024-03-15 at 3 33 08 AM" src="https://github.com/EngOmarElsayed/SwiftUserDefaults/assets/125718818/835a99dc-6ed3-4e35-9ed2-4458ec6935de">

Next, paste the repository link into the search field and click on 'Add Package':

<img width="300" alt="Screenshot 2024-03-15 at 3 34 52 AM" src="https://github.com/EngOmarElsayed/SwiftUserDefaults/assets/125718818/2d5ba858-9e78-4517-a233-85fb936fd4a1">

## How to use <a name="section-1"></a>
Utilizing this API is designed to be straightforward and as effortless as using the @AppStorage API. Simply add this property wrapper to your variable and provide it with a key - that's all there is to it

```swift
@UserDefaults(key: "previewShown") var previewShown = false // false is the default value
```

To help you better organize your UserDefaults keys, I've created an enum called DefaultKeys to store them. Just extend the enum and add new keys as static properties like this:

```swift
extension DefaultKeys {
  static let previewShown = "previewShown"
}
```
### Custome Container <a name="sub-topic-1.1"></a>


### Supported Data <a name="sub-topic-1.2"></a>
This is another sub-topic within Section 1.

## Storing Custome Data <a name="section-2"></a>
This is the second section of your document. You can write your content here, similar to Section 1.

### Example 1 Enums <a name="sub-topic-2.1"></a>
This is a sub-topic within Section 2.

### Example 2 Custom Array type <a name="sub-topic-2.2"></a>
This is another sub-topic within Section 2.

## Conclusion <a name="conclusion"></a>
This is the conclusion section of your document. You can summarize the key points discussed in your document here.

## References
- [Reference 1](#)
- [Reference 2](#)
