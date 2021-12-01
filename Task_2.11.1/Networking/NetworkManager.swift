//
//  NetworkManager.swift
//  Task_2.10.1
//
//  Created by Никита Бат on 27.11.2021.
//

import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func getNewsWithAlamofire(completion: @escaping(Result<[News], NetworkError>) -> Void) {
        AF.request("https://api.npoint.io/e7a66be6073ea4d5dea6")
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                    case .success(let value):
                        let news = News.getNews(from: value)
                        completion(.success(news))
                    case .failure:
                        completion(.failure(.decodingError))
                }
            }
    }
    
}
