//
//  NetworkService.swift
//  NetworkingJSON
//
//  Created by Daniel Dyachok on 11.01.2021.
//

import Foundation

class NetworkService {
    
    func request (urlString: String, compelition: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            DispatchQueue.main.async {
                if let error = error {
                    compelition(.failure(error))
                    return
                }
                guard let data = data else { return }
                compelition(.success(data))
            }
        }.resume()
    }
    
}
