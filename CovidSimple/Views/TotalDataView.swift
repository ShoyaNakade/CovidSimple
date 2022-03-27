//
//  TotalDataView.swift
//  CovidStats
//
//  Created by 中出翔也 on 2022/03/23.
//

import SwiftUI

struct TotalDataView: View {
    var totalData: TotalData
  
    var body: some View {
        
        VStack {
            HStack {
                DataCardView(number: totalData.confirmed.formatNumber, name: "総感染者数", color: .accentColor)
                DataCardView(number: totalData.confirmed_diff.formatNumber, name: "1日の感染者数", color: .accentColor)
//                DataCardView(number: totalData.active.formatNumber, name: "アクティブ", color: .green)
            }
            HStack {
                DataCardView(number: totalData.deaths_diff.formatNumber, name: "死亡数", color: .red)
                DataCardView(number: String(format: "%.2f", totalData.fatality_rate)
                , name: "死亡率 %"
                , color: .red)
            }
        }
        .frame(height: 170)
        .padding(10)
    }
}

struct TotalDataView_PtotalData: PreviewProvider {
    static var previews: some View {
        TotalDataView(totalData: TotalData.dummyData)
    }
}


