//
//  ContentView.swift
//  BasicDict
//
//  Created by 장여훈 on 2023/07/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            PokemonListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
