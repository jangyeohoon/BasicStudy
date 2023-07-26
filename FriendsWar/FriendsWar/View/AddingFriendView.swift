//
//  AddFriendView.swift
//  FriendsWar
//
//  Created by 장여훈 on 2023/07/26.
//

import SwiftUI

struct AddingFriendView: View {
    @EnvironmentObject var friendStore: FriendStore
    
    @Binding var isShowingSheet: Bool
    
    var body: some View {
        // sheet로 올라오는 별도의 화면이기 때문에
        // 독립적인 NavigationStack을 구현했다
        NavigationStack {
            List(friendStore.nominatedFriends) { friend in
                Button {
                    friendStore.add(friend)
                    isShowingSheet.toggle()
                } label: {
                    HStack {
                        AsyncImage(url: URL(string: "\(friend.imageURL)")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 80, height: 80)
                        Text("\(friend.name)")
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("친구 추가")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        Text("취소")
                    }
                }
            }
        }
    }
}

struct AddingFriendView_Previews: PreviewProvider {
    static var previews: some View {
        AddingFriendView(isShowingSheet: .constant(true))
            .environmentObject(FriendStore())
    }
}
