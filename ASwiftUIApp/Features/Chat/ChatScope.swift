//
//  ChatScope.swift
//  ASwiftUIApp
//
//  Created by Eric Liu on 7/14/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import Foundation
import SwiftUI

final class ChatScope {
    // Parent Reference
    // Connection to parent scope through protocol-defined interface
    private let parent: Parent

    init(parent: Parent) {
        self.parent = parent
        print("🟢 ChatScope created")
    }
    
    deinit {
        print("🔴 ChatScope deallocated")
    }

    // Dependencies from Parent
    // Accessing parent-provided resources through lazy properties
    lazy var chatRouter: ChatRouter = parent.chatRouter
    
    lazy var chats: [Chat] = Chat.mock

    // Child Scopes
    // Managing child feature domains within the chat scope
    // (ChatListItemScope removed - ChatListItemView doesn't require scope dependencies)
    
    // View Factory Methods
    // Creating views with proper dependency injection
    func chatFeatureRootview() -> some View {
        ChatFeatureRootView(scope: self)
    }

    func chatListView() -> some View {
        ChatListView(scope: self)
    }
}

extension ChatScope {
    protocol Parent {
        var chatRouter: ChatRouter { get }

        // View Factory Methods
        // Delegate cross-scope view creation to parent
        @ViewBuilder
        func conversationView(contact: Contact) -> any View
    }
}

#if DEBUG
extension ChatScope {
    static var MOCK: ChatScope = ChatScope(parent: RootScope.MOCK)
}

#endif
