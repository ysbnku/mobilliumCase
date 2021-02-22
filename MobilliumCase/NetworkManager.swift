//
//  NetworkManager.swift
//  MobilliumCase
//
//  Created by Yavuz BİTMEZ on 21.02.2021.
//

import Foundation
import Alamofire
import ObjectMapper

enum Service:String {
    case nowPlaying = "movie/now_playing?"
    case upComing = "movie/upcoming?"
    case search = "search/movie?"
    case movie = "movie/"
    
}

class NetworkManager {
    public static let shared = NetworkManager()
    private let baseUrl = "https://api.themoviedb.org/3/"
    private let apiKey = "api_key=bf0432584954482eb2785eec421235dc&"
    private let language = "&language=tr-TR"

    func fetchMovie(service:Service,page:Int,competion:@escaping (Results) -> Void){
        let url = baseUrl + service.rawValue + apiKey + "page=\(page)" + language
        print("<*> apiLink : \(url)")
        Alamofire.request(url).responseJSON { (response) in
            let model :Model = Mapper<Model>().map(JSONObject:response.result.value)!
            switch response.result {
            case .success: model.results?.forEach{ obj in competion(obj)}
            case .failure: print("****Error")
            }
        }
    }
    
    func fetchSearchedMovie(service:Service,query:String,competion:@escaping (Results) -> Void){
        let url = baseUrl + service.rawValue + apiKey + "query=\(query)" + language
        print("<*> apiLink : \(url)")
        Alamofire.request(url).responseJSON { (response) in
            let model :Model = Mapper<Model>().map(JSONObject:response.result.value)!
            switch response.result {
            case .success: model.results?.forEach{ obj in competion(obj)}
            case .failure: print("****Error")
            }
        }
    }
    func fetchMovieDetail(service:Service,id:String,competion:@escaping (Results) -> Void){
        let url = baseUrl + service.rawValue + id + "?" + apiKey  + language
        print("<*> apiLink : \(url)")
        Alamofire.request(url).responseJSON { (response) in
            let result :Results = Mapper<Results>().map(JSONObject:response.result.value)!
            switch response.result {
            case .success: competion(result)
            case .failure: print("****Error")
            }
        }
    }
    
    func fetchMovieSimiliar(service:Service,id:String,competion:@escaping (Results) -> Void){
        let url = baseUrl + service.rawValue + id + "/similar?" + apiKey  + language
        print("<*> apiLink : \(url)")
        Alamofire.request(url).responseJSON { (response) in
            let model :Model = Mapper<Model>().map(JSONObject:response.result.value)!
            switch response.result {
            case .success: model.results?.forEach{ obj in competion(obj)}
            case .failure: print("****Error")
            }
        }
    }
}
