//
//  APICaller.swift
//  NewsApp
//
//  Created by Pritam Dash on 22/06/22.
//

import Foundation
//Object responsible for hitting our api and giving us back some data

final class APICaller {
    //We create this as a singleton.
    static let shared = APICaller()
    
    //Defining some constants
    struct Constants {
        static let topHeadLinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=460aa5777cae408784f2e77063287f80")
    }
    private init() {
        
    }
    
    public func getTopStories(completion : @escaping(Result<[Article], Error>) -> Void) {
        //Perform an API Call so first unwrap the constants url
        guard let url = Constants.topHeadLinesURL else {
            return
        }
        //The reason we need to bind it is that the URL initializer is optional.
       
        let task = URLSession.shared.dataTask(with: url){ data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles  : \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch{
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}

//Models

struct APIResponse: Codable {
    let articles : [Article]
}
struct Article : Codable{
    let source : Source
    let title : String
    let description : String?
    let url : String?
    let urlToImage : String?
    let publishedAt : String
}
struct Source : Codable {
    let name : String
}
