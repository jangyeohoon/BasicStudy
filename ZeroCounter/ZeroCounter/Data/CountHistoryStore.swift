//
//  CountHistoryStore.swift
//  ZeroCounter
//
//  Created by 장여훈 on 2023/08/02.
//

import Foundation

class CountHistoryStore: ObservableObject {
    @Published var countHistoryList: [CountHistory] = []
    
    private func loadData() {
        // UserDefaults로 부터 읽어오기
        if let encoded = UserDefaults.standard.data(forKey: "CountHistoryList") {
            
            let decoder: JSONDecoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([CountHistory].self, from: encoded) {
                
                countHistoryList = decoded
            }
        }
    }
    
    private func saveData() {
        // UserDefaults에 저장하기
        let encoder: JSONEncoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(countHistoryList) {
            UserDefaults.standard.set(encoded, forKey: "CountHistoryList")
        }
    }
    
    func fetchData() {
        loadData()
    }
    
    func addData(count: Int) {
        // 새로운 데이터 추가하기
        let countHistory: CountHistory = CountHistory(count: count)
        countHistoryList.append(countHistory)
        
        // 현재 상태 UserDefaults에 저장하기
        saveData()
    }
    
    func deleteDate(at offsets: IndexSet) {
        // 데이터 삭제하기
        countHistoryList.remove(atOffsets: offsets)
        
        // 현재 상태 저장하기
        saveData()
    }
}
