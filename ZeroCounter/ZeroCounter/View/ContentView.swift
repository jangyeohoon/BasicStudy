//
//  ContentView.swift
//  ZeroCounter
//
//  Created by 장여훈 on 2023/08/02.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTabIndex: Int = 1
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            CounterVIew()
                .tabItem {
                    Label("Counter", systemImage: "number.square.fill")
                }.tag(1)
            
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "list.clipboard.fill")
                }.tag(2)
            
            HelpView()
                .tabItem {
                    Label("Help", systemImage: "questionmark.bubble.fill")
                }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
