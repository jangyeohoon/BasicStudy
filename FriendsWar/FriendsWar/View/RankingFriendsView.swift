//
//  RankingFriendsView.swift
//  FriendsWar
//
//  Created by 장여훈 on 2023/07/26.
//

import SwiftUI

struct RankingFriendsView: View {
    @EnvironmentObject var friendStore: FriendStore
    
    var body: some View {
        List {
            ForEach(0..<friendStore.lineupFriends.count, id: \.self) { index in
                HStack {
                    Text("\(index + 1)")
                        .font(.largeTitle)
                    AsyncImage(url: URL(string: "\(friendStore.lineupFriends[index].imageURL)")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 80, height: 80)
                    Text("\(friendStore.lineupFriends[index].name)")
                        .font(.headline)
                }
            }
        }
        .navigationTitle("친구 순위")
        .onAppear {
            friendStore.lineUp()
        }
        .refreshable {
            friendStore.lineUp()
        }
    }
}

struct RankingFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RankingFriendsView()
                .environmentObject(FriendStore())
        }
    }
}
