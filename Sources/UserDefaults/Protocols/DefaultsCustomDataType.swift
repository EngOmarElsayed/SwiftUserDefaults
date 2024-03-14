//
//  DefaultsCustomDataType.swift
//
//
//  Created by Eng.Omar Elsayed on 13/03/2024.
//

import Foundation

/// conform your data type to this protocol if you want to store custom data to the userDefaults.
/// Note: All the child types should conform to Codable.
public protocol DefaultsCustomDataType: Codable {}
