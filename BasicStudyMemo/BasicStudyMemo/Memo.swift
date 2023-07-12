//
//  Memo.swift
//  BasicStudyMemo
//
//  Created by 장여훈 on 2023/07/12.
//

import Foundation
import SwiftUI

struct Memo: Identifiable {
    var id: UUID = UUID()
    var text: String
    var color: Color
    var created: Date
    
    var createdString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy년 MM월 dd일"
            
            return dateFormatter.string(from: created)
        }
    }
}

class MemoStore: ObservableObject {
    
    @Published var memos: [Memo] = [
        Memo(text: "Example Memo", color: .blue , created: Date()),
        
    ]
    
    func addMemo(_ text: String, color: Color) {
        let memo: Memo = Memo(text: text, color: color, created: Date())
        
        // 맨 아래로 새 메모가 보이게 된다
        // memos.append(memo)
        
        // 맨 위에 새 메모가 보이게 하고 싶다
        // memos = [memo] + memos
        memos.insert(memo, at: 0)
    }
    
    func removeMemo(_ targetMemo: Memo) {
        print("\(targetMemo.id)를 삭제합니다")
        
        var index: Int = 0
        
        for tempMemo in memos {
            if tempMemo.id == targetMemo.id {
                
                memos.remove(at: index)
                break
            }
            
            index += 1
        }
    }
}
