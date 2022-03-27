//
//  AlertItem.swift
//  CovidStats
//
//  Created by 中出翔也 on 2022/03/24.
//

import SwiftUI


struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let unableToFetchTotalStats = AlertItem(title: Text("Error World Total!"), message: Text("サーバーがー応答しません \n もう一度試してください。"), dismissButton: .default(Text("OK")))
    
    static let unableToFetchCountryStats = AlertItem(title: Text("Error Country Data!"), message: Text("国別データが取得できません。 \n もう一度試してください。"), dismissButton: .default(Text("OK")))
    
    static let unableToFetchCountries = AlertItem(title: Text("Error Country Data!"), message: Text("国の情報が取得できません。 \n もう一度試してください。"), dismissButton: .default(Text("OK")))
    
}
