//
//  ChatRouter.swift
//  ASwiftUIApp
//
//  Created by Eric Liu on 7/5/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import Foundation

protocol ChatRouter {
    func gotoConversation(recipient: Contact)

    func gotoContactDetail(_ contact: Contact)

    func gotoContactList()

    // Generic navigation methods
    func goBack()

    func popToRoot()
}


#if DEBUG
class MockChatRouter: ChatRouter {
    static let shared = MockChatRouter()

    func gotoContactList() {
        // No-op
    }

    func gotoConversation(recipient: Contact) {
        // No-op
    }

    func gotoContactDetail(_ contact: Contact) {
        // no-op
    }

    func goBack() {
        // No-op
    }

    func popToRoot() {
        // No-op
    }
}

#endif
