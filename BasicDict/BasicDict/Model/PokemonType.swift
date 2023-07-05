//
//  PokemonType.swift
//  BasicDict
//
//  Created by 장여훈 on 2023/07/05.
//

import Foundation

enum PokemonType: String {
    case normal = "노말"
    case fire = "불꽃"
    case water = "물"
    case electric = "전기"
    case grass = "풀"
    case ice = "얼음"
    case fighting = "격투"
    case poison = "독"
    case ground = "땅"
    case flying = "비행"
    case psychic = "에스퍼"
    case bug = "벌레"
    case rock = "바위"
    case ghost = "고스트"
    case dragon = "드래곤"
    case dark = "악"
    case steel = "강철"
    case fairy = "페어리"
    
    // enum에 저장프로피는 추가할 수 없지만
    // 연산 프로퍼티는 추가할 수 있다
    var displayString: String {
        switch self {
        case .normal:
            return "⬜️노말"
        case .fire:
            return "🔥불꽃"
        case .water:
            return "💧물"
        case .electric:
            return "⚡️전기"
        case .grass:
            return "🍃풀"
        case .ice:
            return "❄️얼음"
        case .fighting:
            return "🥊격투"
        case .poison:
            return "🧪독"
        case .ground:
            return "🕳️땅"
        case .flying:
            return "✈️비행"
        case .psychic:
            return "🔮에스퍼"
        case .bug:
            return "🕷️벌레"
        case .rock:
            return "🪨바위"
        case .ghost:
            return "👻고스트"
        case .dragon:
            return "🐉드래곤"
        case .dark:
            return "👿악"
        case .steel:
            return "⛓️강철"
        case .fairy:
            return "🧝‍♀️페어리"
        }
    }
}
