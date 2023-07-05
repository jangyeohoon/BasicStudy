//
//  Pokemon.swift
//  BasicDict
//
//  Created by 장여훈 on 2023/07/05.
//

import Foundation

struct Pockemon: Identifiable {
    var id: UUID = UUID()
    
    var name: String
    var number: Int
    var imagePath: String
    var types: [PokemonType]
    
    var numberString: String { "No.\(number)" }
    
    // struct는 따로 init함수 안만들어도 시스템이 만들어준다
}
