//
//  DataCardView.swift
//  CovidStats
//
//  Created by 中出翔也 on 2022/03/23.
//

import SwiftUI

struct DataCardView: View {
    
    var number: String = "--"
    var name: String = " Error"
    var color: Color = .primary
    
    var body: some View {
        //MARK: - geometryでサイズ変更にも対応。
        GeometryReader { geometry in
            VStack(spacing: 10) {
                Text(self.number)
                    .font(.subheadline)
                    .foregroundColor(self.color)
                
                Text(self.name)
                    .font(.body)
                    .foregroundColor(self.color)
            }
            .frame(width: geometry.size.width, height: 80, alignment: .center)
            .background(Color("cardBackground"))
            .cornerRadius(8.0)
        }
    }
}

struct DataCardView_Previews: PreviewProvider {
    static var previews: some View {
        DataCardView()
    }
}
