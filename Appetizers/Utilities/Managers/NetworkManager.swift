//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Samehan Sonwane on 21/07/24.
//

import UIKit

final class NetworkManager{
    static let shared = NetworkManager()
    private let cache = NSCache<NSString , UIImage>()
 
    //https://gist.githubusercontent.com/samehan/b393a61960a3248eaa3553a67aedda2c/raw/91452eb03c8cecdd881bb4e040f9ff8464b94511/samehanappetizer.json
    //    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    //    private let appetizerURL = baseURL + "appetizers"
    
    static let baseURL = "https://gist.githubusercontent.com/samehan/b393a61960a3248eaa3553a67aedda2c/raw/91452eb03c8cecdd881bb4e040f9ff8464b94511/"
    private let appetizerURL = baseURL + "samehanappetizer.json"
    
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invaildURL))
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invaildResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    func downloadImage(fromURLString urlString: String, completed: @escaping(UIImage?) -> Void){
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        guard let url = URL(string:urlString) else{
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else{
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
            
        }
        
        task.resume()
    }
}
