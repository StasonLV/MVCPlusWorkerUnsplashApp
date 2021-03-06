//
//  DataFetch.swift
//  MVCPlusWorkerUnsplashApp
//
//  Created by Stanislav Lezovsky on 26.06.2022.
//

import Foundation

class NetworkDataFetcher {
    
    var networkService = NetworkService()
    
    func fetchRandomImages(completion: @escaping ([UnsplashPhoto]?) -> ()) {
        networkService.randomPhotosRequest() { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                completion(nil)
            }
            guard let data = data else { return }
            let decode = try? JSONDecoder().decode([UnsplashPhoto].self, from: data)
            completion(decode)
        }
    }
    
    func fetchImages(searchTerm: String, completion: @escaping (SearchResults?) -> ()) {
        networkService.request(searchTerm: searchTerm) { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                completion(nil)
            }
            let decode = self.decodeJSON(type: SearchResults.self, from: data)
            completion(decode)
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
}
