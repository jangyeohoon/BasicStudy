//
//  PockemonCellView.swift
//  BasicDict
//
//  Created by 장여훈 on 2023/07/05.
//

import SwiftUI

struct PockemonCellView: View {
    var pockemon: Pockemon
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: pockemon.imagePath)) { image in
                
                // 이미지를 가져와서 크기 조절 가능하고,
                // .fit으로 비율 맞추는게 보통 패턴 (국룰)
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75)
                    .padding()
            } placeholder: {
                 ProgressView()
                // Text("그림 로딩중")
            }
            
            VStack(alignment: .leading) {
                Text("\(pockemon.name)")
                    .bold()
                    .padding(.bottom)
                
                Text("\(pockemon.numberString)")
                
                HStack {
                    // types의 type은 당연히 PokemonType 타입
                    // type의 displayString(연산프로퍼티)을
                    // 써서 보여주면 된다
                    // ForEach문에 types 배열이 적용되려면
                    // Identifiable 프로토콜을 따라야 되지만
                    // id값을 저장 프로퍼티로 type에 추가할 수 없어서
                    // "id: \.self" 넣는 걸로 해결했다!
                    ForEach(pockemon.types, id: \.self) { type in
                        Text("\(type.displayString)")
                    }
                }
            }
        }
    }
}

struct PockemonCellView_Previews: PreviewProvider {
    static var previews: some View {
        PockemonCellView(pockemon: pockemons[0])
    }
}
