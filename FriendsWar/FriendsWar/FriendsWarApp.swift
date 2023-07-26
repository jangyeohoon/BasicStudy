//
//  FriendsWarApp.swift
//  FriendsWar
//
//  Created by 장여훈 on 2023/07/26.
//

import SwiftUI

@main
struct FriendsWarApp: App {
    
    let friendStore: FriendStore = FriendStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(friendStore)
        }
    }
}
