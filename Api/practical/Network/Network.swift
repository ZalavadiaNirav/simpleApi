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
    
    func getData<T: Codable>(description: String, location: String,type:T.Type, completion: @escaping (Result<T, ErrorMessage>) -> Void)
    {
        let urlString = "https://itunes.apple.com/search?term=\(description.replacingOccurrences(of: " ", with: "+"))&location=\(location.replacingOccurrences(of: " ", with: "+"))"
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
            guard let data1 = data else {
                completion(.failure(.invalidData))
                return
            }
            let responseM = Response(data:data1)
            guard let responseModel = responseM.decode(type) else {
                completion(.failure(.invalidResponse))
                return
            }
            completion(.success(responseModel))
            
        }
        task.resume()
    }
    
}

struct Response {
    fileprivate var data: Data
    init(data: Data) {
        self.data = data
    }
}

extension Response {
    public func decode<T: Codable>(_ type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        
        do {
            let response = try jsonDecoder.decode(T.self, from:data)
            return response
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
        
        return nil
    }
}
