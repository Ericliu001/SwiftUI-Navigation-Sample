//
//  Router.swift
//  ASwiftUIApp
//
//  Created by Eric Liu on 7/1/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import Foundation
import SwiftUI

@Observable
final class Router: ContactRouter, ChatRouter, SettingsRouter {
    var selectedTab: Tabs = .chats
    var chatTabPath : [Destination] = []
    var settingsTabPath: [Destination] = []

    // Computed property for current navigation stack
    var currentStack: [Destination] {
        get {
            switch selectedTab {
            case .chats:
                return chatTabPath
            case .settings:
                return settingsTabPath
            }
        }
        set {
            switch selectedTab {
            case .chats:
                chatTabPath = newValue
            case .settings:
                settingsTabPath = newValue
            }
        }
    }

    // Generic navigation methods
    func goBack() {
        if !currentStack.isEmpty {
            currentStack.removeLast()
        }
    }

    func popToRoot() {
        currentStack.removeAll()
    }

    func gotoChats() {
        selectedTab = .chats
        chatTabPath = []
    }

    func gotoConversation(recipient: Contact) {
        chatTabPath = [.conversation(recipient)]
    }

    func gotoContactDetail(_ contact: Contact){
        chatTabPath.append(.contactDetail(contact))
    }

    func gotoContactList(){
        chatTabPath.append(.contactList)
    }

    func goToProfile() {
        settingsTabPath.append(.profile_settings)
    }

    func gotoPrivacy() {
        settingsTabPath.append(.privacy_settings)
    }
}
