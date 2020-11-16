//
//  Network.swift
//  practical
//
//  Created by Nirav  on 15/11/20.
//

import Foundation

class Network
{
    static let shared = Network()
    
    func getData(description: String, location: String, completion: @escaping (Result<[Results], ErrorMessage>) -> Void)
    {
        let urlString = "https://jobs.github.com/positions.json?description=\(description.replacingOccurrences(of: " ", with: "+"))&location=\(location.replacingOccurrences(of: " ", with: "+"))"
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
            if let _ = error
            {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse,response.statusCode == 200 else
            {
                completion(.failure(.invalidResponse))
                return
            }
            guard data == data else {
                completion(.failure(.invalidData))
                return
                
            }
            do {
                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try decoder.decode([Results].self, from:data!)
                completion(.success(results))
            } catch
            {
                completion(.failure(.invalidData))
            }
            
        }
        task.resume()
    }
    
    
}
