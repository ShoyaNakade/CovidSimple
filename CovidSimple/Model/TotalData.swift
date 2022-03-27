//
//  TotalData.swift
//  CovidStats
//
//  Created by 中出翔也 on 2022/03/22.
//

import Foundation

struct TotalDataObject: Codable {
    let data: TotalData // APIに合わせている
}

struct TotalData: Codable {
    let confirmed: Int
    let deaths: Int
    let confirmed_diff: Int
    let deaths_diff: Int
    let active: Int
    let fatality_rate: Double
    
    static let dummyData = TotalData(confirmed: 0, deaths: 0, confirmed_diff: 0,deaths_diff: 0, active: 0, fatality_rate: 0)
}
