//
//  ContentView.swift
//  basicStudy0614
//
//  Created by 장여훈 on 2023/06/14.
//

import SwiftUI

struct ContentView: View {
    
    @State var num: Int = 0
    
    var body: some View {
        VStack {
            
            Text("Counter")
                .font(.largeTitle)
                .padding()
            
            Text("\(num)")
                .padding()
            
            
            HStack{
                Spacer()
                Button {
                    num += 1
                } label: {
                    Text("1Up")
                        .font(.largeTitle)
                    
                }
                Spacer()
                
                Button {
                    num -= 1
                } label: {
                    Text("1Down")
                        .font(.largeTitle)
                    
                }
                Spacer()
                
                
            }
            .padding()
            HStack{
                Spacer()
                Button {
                    num += 10
                } label: {
                    Text("10Up")
                        .font(.largeTitle)
                    
                }
                Spacer()
                
                Button {
                    num -= 10
                } label: {
                    Text("10Down")
                        .font(.largeTitle)
                    
                }
                Spacer()
            
                
            }
            .padding()
            HStack{
                Button {
                    num = 0
                } label: {
                    Text("Reset")
                        .font(.largeTitle)
                    
                }
            }
        }
        .padding()
        
    }
    
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
