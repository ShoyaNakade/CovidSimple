//
//  MainView.swift
//  CovidStats
//
//  Created by 中出翔也 on 2022/03/22.
//


import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    let formatter = DateFormatter()
    let today: String
    
    init() {
        formatter.dateFormat = "y-MM-dd" // APIに合わせる
        self.today = formatter.string(from: Date())
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            //　背景(おまけ)
            LinearGradient(colors: [
                Color(red: 0.76, green: 0.15, blue: 0.26),
                Color(red: 0.01, green: 0.23, blue: 0.5)
            ], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            
            VStack(alignment: .leading) {
                Text("世界の総数:(\(today))")
                    .font(.title2.bold())
                    .foregroundColor(.primary)
                    .padding(10)
                TotalDataView(totalData: viewModel.totalData)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

