//
//  ContentView.swift
//  checkQuiz
//
//  Created by 장여훈 on 2023/07/03.
//

import SwiftUI

struct ContentView: View {
    @State var number1: Int = 4
    @State var number2: Int = 2
    @State var resultNumber: Int = 9
    @State var countCorrect: Int = 0
    @State var countWrong: Int = 0
    
    // init()  만들 수는 있다.
    // 애플은 이거 건들지 말라고 한다.
    
    var body: some View {
        VStack {
            Text("다음 수식은 맞을까요?")
            
            Spacer()
            
            Text("\(number1) \u{D7} \(number2) = \(resultNumber)")
            
            Spacer()
            
            HStack {
                Spacer()
                
                Button {
                    // action
                    selectCorrect()
                } label: {
                    HStack {
                        Image(systemName: "checkmark.diamond.fill")
                        Text("맞음")
                            .bold()
                    }
                    .foregroundColor(.green)
                }
                
                Spacer()
                
                Button {
                    // action
                    selectWrong()
                } label: {
                    HStack {
                        Image(systemName: "xmark.diamond")
                        Text("틀림")
                            .bold()
                    }
                    .foregroundColor(.red)
                }
                
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Text("\(countCorrect)개 맞춤")
                Spacer()
                Text("\(countWrong)개 틀림")
                Spacer()
            }
            
            Spacer()
            
            Button("카운트 초기화") {
                // action
                countCorrect = 0
                countWrong = 0
                reloadGame()
            }
        }
        .font(.largeTitle)
        .padding()
        .onAppear {
            // 화면에 이 View가 나타날때 처리할 코드를 여기 적어주세요
            // UIKit에서 ViewController의 viewDidLoad와 비슷하게 활용할 수 있다
            reloadGame()
        }
        .task {
            // .onAppear 수정자와 비슷한데, 좀 다르다
            // 이건 나중에 배워요!
        }
    }
    
    func reloadGame() {
        print("새로운 게임 시작")
        
        number1 = Int.random(in: 0...10)
        number2 = Int.random(in: 0...10)
        
        // 확률을 반으로 만드는 예제
        // let rate: Bool = Bool.random()
        
        // 확률을 1/3로 만드는 예제
        let rate: Int = Int.random(in: 0...2)
        
        if rate < 1 {
            resultNumber = number1 * number2
        } else {
            if Bool.random() {
                resultNumber = number1 * number2 + Int.random(in: 1...10)
            } else {
                resultNumber = number1 * number2 - Int.random(in: 1...10)
            }
        }
    }
    
    // O 버튼을 눌렀을 때
    func selectCorrect() {
        if number1 * number2 == resultNumber {
            // 올바른 답을 선택했다
            countCorrect += 1
        } else {
            // 틀린 답을 선택했다
            countWrong += 1
        }
        
        reloadGame()
    }
    
    // X 버튼을 눌렀을 때
    func selectWrong() {
        if number1 * number2 == resultNumber {
            // 올바른 답을 선택했다
            countWrong += 1
        } else {
            // 틀린 답을 선택했다
            countCorrect += 1
        }
        
        reloadGame()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
