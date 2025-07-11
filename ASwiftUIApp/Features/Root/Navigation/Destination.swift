//
//  Destination.swift
//  ASwiftUIApp
//
//  Created by Eric Liu on 7/1/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import Foundation


enum Destination: Hashable {
    case contactList
    case conversation(Contact)
    case contactDetail(Contact)
    case profile_settings
    case privacy_settings
}
