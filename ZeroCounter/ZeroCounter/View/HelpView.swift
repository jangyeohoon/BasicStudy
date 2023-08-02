//
//  HelpView.swift
//  ZeroCounter
//
//  Created by 장여훈 on 2023/08/02.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 5, dash: [5]))
                .foregroundColor(.gray)
            
            Text("Touch here for adding a count")
        }
        .padding()
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
