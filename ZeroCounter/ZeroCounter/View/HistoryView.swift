//
//  HistoryView.swift
//  ZeroCounter
//
//  Created by 장여훈 on 2023/08/02.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var countHistoryStore: CountHistoryStore = CountHistoryStore()
    
    var body: some View {
        NavigationStack {
            List {
                // 만약 보여줄 리스트의 내용이 없다면
                // 사용자에게 "내용 없음"을 알려주는 것이 좋다.
                if countHistoryStore.countHistoryList.isEmpty {
                    Text("THere is no history data")
                } else {
                    ForEach(countHistoryStore.countHistoryList) { history in
                        VStack(alignment: .leading) {
                            Text("\(history.count)")
                                .fontWeight(.heavy)
                                .font(.largeTitle)
                            Text("\(history.dateString)")
                        }
                    }
                    .onDelete { indexSet in
                        // List에서 onDelete가 IndexSet을 주는 이유는
                        // 여러 개의 항목들을 한번에 선택 삭제할 수도 있기 때문이다
                        countHistoryStore.deleteDate(at: indexSet)
                    }
                }
            }
            .navigationTitle("History")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
            .refreshable {
                // 당겨서 새로고침으로 최신 UserDefaults 값을 가져온다
                countHistoryStore.fetchData()
            }
            .onAppear {
                // 화면에 내용이 보일즈음 최신 UserDefaults 값을 가져온다
                countHistoryStore.fetchData()
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
