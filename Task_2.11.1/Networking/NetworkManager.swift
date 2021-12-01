//
//  NetworkManager.swift
//  Task_2.10.1
//
//  Created by Никита Бат on 27.11.2021.
//

import Foundation

class NetworkManager {
    
    class func getData(completion: @escaping (([News]) -> Void)) {
        guard let url = URL(string: "https://api.npoint.io/e7a66be6073ea4d5dea6") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let news = try JSONDecoder().decode([News].self, from: data)
                DispatchQueue.main.async {
                    completion(news)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}
