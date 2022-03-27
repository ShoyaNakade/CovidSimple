//
//  APIService.swift
//  CovidStats
//  https://rapidapi.com/axisbits-axisbits-default/api/covid-19-statistics/
//  Created by 中出翔也 on 2022/03/22.
//

import Foundation

final class APIService {
    
    static let shared = APIService()
    private let baseURLString = "https://covid-19-statistics.p.rapidapi.com"
    private let headers = [
        "X-RapidAPI-Host": "covid-19-statistics.p.rapidapi.com",
        "X-RapidAPI-Key": "eda6f3892emsh2d191f757d6c379p1e4dd5jsn14e1a892529f" //This is free Key by NakadeShoya
    ]
    
    func fetchTotalData(completion: @escaping ( Result<TotalData, Error>) -> Void) {
        //MARK: - 1.API取得先URLの作成
        let totalURLString = baseURLString + "/reports/total"
        let url = URL(string:  totalURLString)
        
        guard let url = url else {
            completion(.failure(CovidError.incorrectURL))
            return
        }
        
        //MARK: - 2.URLリクエストの作成
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 100.0)
        request.httpMethod = "GET" // 初期値でもGETだが、明示のため。
        request.allHTTPHeaderFields = headers

        //MARK: - 3.TASKの作成
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            if (error != nil) {
                completion(.failure(CovidError.noDataReceived))
            } else {
//                if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
//                    print(json)
//                }
                let decorder = JSONDecoder()
                
                do {
                    let totalDataObject = try decorder.decode(TotalDataObject.self, from: data!)
                    completion(.success(totalDataObject.data))
                } catch let error {
                    completion(.failure(error))
                }
                
            }
        })
        //MARK: - 4.TASKの実行
        dataTask.resume() //
    }
}
