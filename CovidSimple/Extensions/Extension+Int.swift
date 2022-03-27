//
//  Extension+Int.swift
//  CovidStats
//
//  Created by 中出翔也 on 2022/03/23.
//

import Foundation

extension Int {
    var formatNumber: String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self))!
    }
}
