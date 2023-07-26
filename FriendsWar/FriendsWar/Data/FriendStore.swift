//
//  FriendStore.swift
//  FriendsWar
//
//  Created by 장여훈 on 2023/07/26.
//

import Foundation
import Combine

class FriendStore: ObservableObject {
    @Published var selectedFriends: [Friend] = []
    @Published var lineupFriends: [Friend] = []
    
    var nominatedFriends: [Friend] = []
    
    // 클래스 인스턴스가 생성될 때 호출되는 초기화 메서드
    // fetch() 메서드를 호출하여 nominatedFriends를 초기화
    init() {
        fetch()
    }
    
    // json파일에서 nominatedFriends를 불러오고
    func fetch() {
        nominatedFriends = loadJson("friends.json")
        
        do {
            if let data = UserDefaults.standard.object(forKey: "SelectedFriends") as? Data {
                selectedFriends = try JSONDecoder().decode([Friend].self, from: data)
            }
        } catch {
            print("UserDefaults로 부터 데이터 가져오기 실패")
        }
    }
    
    func save() {
 
        do {
            let data: Data = try JSONEncoder().encode(selectedFriends)
            
            UserDefaults.standard.set(data, forKey: "SelectedFriends")
        } catch {
            print("JSON 생성 후 UserDefaults 실패")
        }
    }
    
    func lineUp() {
        lineupFriends = selectedFriends.shuffled()
    }
    
    func add(_ friend: Friend) {
        selectedFriends.append(friend)
        save()
    }
    
    func reset() {
        selectedFriends.removeAll()
        save()
    }
    
    func loadJson(_ filename: String) -> [Friend] {
        let data: Data
        
     
        guard let file: URL = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("\(filename) not found.")
        }
        
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Could not load \(filename): \(error)")
        }
        
        do {
            return try JSONDecoder().decode([Friend].self, from: data)
        } catch {
            fatalError("Unable to parse \(filename): \(error)")
        }
    }
}

