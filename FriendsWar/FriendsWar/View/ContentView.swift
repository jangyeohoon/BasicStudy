//
//  ContentView.swift
//  FriendsWar
//
//  Created by 장여훈 on 2023/07/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            SelectedFriendsView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FriendStore())
    }
}
