//
//  CounterVIew.swift
//  ZeroCounter
//
//  Created by 장여훈 on 2023/08/02.
//

import SwiftUI

struct CounterVIew: View {
    
    // 이곳에 CountHistoryStore를 별도로 만들어 이렇게 써도
    // UserDefaults에 값을 저장하는 용도라서 별 문제 없다고 본다
    @ObservedObject var countHistoryStore: CountHistoryStore = CountHistoryStore()
    // UserDefaults 저장소를 사용하는 가장 단순한 방법! SwiftUI 4.0 이상에서 사용 가능
    // Int, String, Bool 타입 정도에 사용
    @AppStorage("Z") private var count: Int = 0
    
    @State private var showAlert: Bool = false
    
    // .alert은 View에 하나만 써야 하기 때문에
    // 미리 하나의 .alert에서 어떤 Alert으로 처리해야할지
    // 경우의 수를 생각해줘야 한다
    enum AlertCase {
        case none
        case reset
        case saved
    }
    
    @State private var alertCase: AlertCase = .none
    
    private let fontsize: CGFloat = 250
    
    var countString: String {
//        if count > 0 {
//            return "\(count)"
//        } else {
//            return "ZERO"
//        }
        
        count > 0 ? "\(count)" : "ZERO"
    }
    
    var body: some View {
        VStack{
            Button {
                count += 1
                
                // 햅틱 피드백으로 진동을 만든다
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
                
            } label: {
                Spacer()
                VStack {
                    Spacer()
                    Text("\(countString)")
                        .font(.system(size: fontsize))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("countColor"))
                        .lineLimit(1) // 텍스트 라인 제한
                        .minimumScaleFactor(0.1) // 문자열 개수가 늘어남에 따라 폰트를 줄여준다!!
                }
                Spacer()
            }
            
            .background(Color.accentColor)
            
            HStack {
                Button {
                    if count > 0 {
                        count -= 1
                    }
                } label: {
                    Text("Down")
                        .padding()
                }
                
                Text("|")
                    .padding()
                
                Button {
                    alertCase = .reset
                    showAlert.toggle()
                } label: {
                    Text("Reset")
                        .padding()
                }
            }
            .padding()
            Button  {
                countHistoryStore.addData(count: count)
                alertCase = .saved
                showAlert.toggle()
            } label: {
                Label("Save current data", systemImage: "square.and.arrow.down.fill")
                    .padding()
            }
            Spacer()
        }
        // alert를 2개를 만들 수 없어서 후행 클로저로 alert 목적에 맞게 만들었다.
        .alert(isPresented: $showAlert) {
            switch alertCase {
            case .none:
                return Alert(title: Text("Completed"))
            case .reset:
                return Alert(title: Text("Are you sure"),
                             message: Text("this will erase all data"),
                             primaryButton: .destructive(Text("Reset")) {
                    count = 0
                },
                             secondaryButton: .cancel()
                )
            case .saved:
                return Alert(title: Text("Saving is completer."), message: Text("into history tab."))
            }
        }
    }
}

struct CounterVIew_Previews: PreviewProvider {
    static var previews: some View {
        CounterVIew()
    }
}
