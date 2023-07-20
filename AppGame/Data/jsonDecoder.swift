//
//  DataController.swift
//  AppGame
//
//  Created by Марк Горкій on 19.07.2023.
//

import Foundation

func getLink(completion: @escaping (Result<JSONItem, Error>) -> Void) {
    let url = URL(string: "https://raw.githubusercontent.com/Forkipe/JSONfile/main/GameApp1.json")!
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        guard let data = data else {
            completion(.failure(NSError(domain: "com.GameApp.error", code: 0, userInfo: nil)))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let link = try decoder.decode(JSONItem.self, from: data)
            completion(.success(link))
        } catch let decodingError as DecodingError {
            completion(.failure(decodingError))
        } catch {
            completion(.failure(error))
        }
    }
    
    task.resume()
}














