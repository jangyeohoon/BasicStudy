//
//  ContentView.swift
//  BasicDict
//
//  Created by 장여훈 on 2023/07/05.
//

import SwiftUI

struct PokemonListView: View {
    var body: some View {
        
        // characters 배열의 각 항목들을 꺼내서
        // 매번 character라는 이름으로 사용해
        // 리스트를 완성한다
        // characters 배열의 각 항목들은
        // Identifiable 프로토콜을 따라야 한다
        List(pockemons) { pockemon in
            NavigationLink {
                PokemonDetailView(pockemon: pockemon)
            } label: {
                PockemonCellView(pockemon: pockemon)
            }
        }
        .navigationTitle("포켓몬 도감")
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PokemonListView()
        }
    }
}
