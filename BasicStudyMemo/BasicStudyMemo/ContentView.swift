//
//  ContentView.swift
//  BasicStudyMemo
//
//  Created by 장여훈 on 2023/07/12.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var memoStore: MemoStore = MemoStore()
    
    @State var isSheetShowing: Bool = false
    
    @State var memoText: String = ""
    
    @State var memoColor: Color = .blue
    
    let colors: [Color] = [.blue, .cyan, .purple, .yellow, .indigo]
    
    var body: some View {
        NavigationStack {
            List(memoStore.memos) { memo in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(memo.text)")
                            .font(.title)
                        
                        Text("\(memo.createdString)")
                            .font(.body)
                            .padding(.top)
                    }
                    
                    Spacer()
                }
                .padding()
                .foregroundColor(.white)
                .background(memo.color)
                .shadow(radius: 3)
                .padding()
                .contextMenu {
                    ShareLink(item: memo.text)
                    
                    Button {
                        memoStore.removeMemo(memo)
                    } label: {
                        Image(systemName: "trash.slash")
                        Text("삭제")
                    }
                    
                }
            }
            .listStyle(.plain)
            .navigationTitle("mememo")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("추가") {
                        // 창을 띄울 때마다 새로운 빈 메모장이 보이게 하자
                        // 그러기 위해서 창 닫을 때 텍스트 지워주자
                        // 취소, 완료버튼 눌리는 곳에 각각 처리를 맡겨도 되지만
                        // sheet를 드래그로 내리는 경우도 있어서 여기에 추가하는 게 좋겠다
                        memoText = ""
                        
                        isSheetShowing = true
                    }
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                VStack {
                    HStack {
                        Button("취소") {
                            isSheetShowing = false
                        }
                        Spacer()
                        
                        Button("완료") {
                            memoStore.addMemo(memoText, color: memoColor)
                            isSheetShowing = false
                        }
                        .disabled(memoText.isEmpty)
                    }
                    
                    HStack {
                        ForEach(colors, id: \.self) { color in
                            Button {
                                memoColor = color
                            } label: {
                                HStack {
                                    Spacer()
                                    
                                    if color == memoColor {
                                        Image(systemName: "checkmark.circle")
                                    }
                                    
                                    Spacer()
                                }
                                .padding()
                                .frame(height: 50)
                                .foregroundColor(.white)
                                .background(color)
                                .shadow(radius: color == memoColor ? 8 : 0)
                            }
                        }
                    }
                    
                    Divider()
                        .padding()
                    
                    TextField("메모를 입력하세요", text: $memoText, axis: .vertical)
                        .padding()
                        .foregroundColor(.white)
                        .background(memoColor)
                        .shadow(radius: 3)
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
