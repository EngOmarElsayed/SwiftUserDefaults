//
//  ArrayExtension.swift
//
//
//  Created by Eng.Omar Elsayed on 13/03/2024.
//

import Foundation

// This extension was made to make the array conform to `DefaultsCustomDataType` only if the element conforms to the `DefaultsCustomDataType`
extension Array: DefaultsCustomDataType where Element: DefaultsCustomDataType {}
