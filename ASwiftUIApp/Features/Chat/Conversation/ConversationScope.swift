//
//  ConversationScope.swift
//  ASwiftUIApp
//
//  Created by Eric Liu on 7/16/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import Foundation
import SwiftUI

final class ConversationScope {
    private let parent: Parent
    
    init(parent: Parent) {
        self.parent = parent
        print("🟢 ConversationScope created")
    }
    
    deinit {
        print("🔴 ConversationScope deallocated")
    }
    
    // Local Dependencies
    // Scope-specific state and resources that belong to the chat feature
    lazy var messages: [Message] = Message.sampleData
    
    lazy var router: ChatRouter = parent.chatRouter
    
    func conversationView(contact: Contact) -> some View {
        ConversationView(scope: self, contact: contact)
    }
}

extension ConversationScope {
    protocol Parent {
        var chatRouter: ChatRouter { get }
    }
}


#if DEBUG
extension ConversationScope {
    static var MOCK: ConversationScope = ConversationScope(parent: RootScope.MOCK)
}
#endif
