//
//  SelectedFrendsView.swift
//  FriendsWar
//
//  Created by 장여훈 on 2023/07/26.
//

import SwiftUI
import SafariServices

struct SelectedFriendsView: View {
    
    @EnvironmentObject var friendStore: FriendStore
    
    @State private var isShowingSheet: Bool = false
    
    var body: some View {
        
        VStack {
            if friendStore.selectedFriends.isEmpty {
                Text("친구를 추가해주세요")
            } else {
                List(friendStore.selectedFriends) { friend in
                    NavigationLink {
                        // 기본 웹브라우저 앱으로 보여주기
                        // UIApplication.shared.open(url)
                        SafariWebView(urlString: friend.link)
                            .navigationTitle("\(friend.name)")
                            .navigationBarTitleDisplayMode(.inline)
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
                NavigationLink {
                    RankingFriendsView()
                } label: {
                    Text("줄세우기")
                }
                
            }
        }
        .navigationTitle("우리 친구들")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    isShowingSheet.toggle()
                } label: {
                    Text("추가")
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    friendStore.reset()
                } label: {
                    Text("초기화")
                }
            }
        }
        .sheet(isPresented: $isShowingSheet) {
            AddingFriendView(isShowingSheet: $isShowingSheet)
        }
    }
}

struct SafariWebView: UIViewControllerRepresentable {
    let urlString: String
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let url = URL(string: urlString)!
        
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    }
}

struct SelectedFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SelectedFriendsView()
                .environmentObject(FriendStore())
        }
    }
}

