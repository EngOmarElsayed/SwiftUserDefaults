//
//  AnyOptional.swift
//
//
//  Created by Eng.Omar Elsayed on 13/03/2024.
//

import Foundation

/// This protocol is made to make custom propertyWrapper work easily with optional values. Not indented to be used in any place outside the package.
internal protocol AnyOptional {
  var isNil: Bool { get }
}
