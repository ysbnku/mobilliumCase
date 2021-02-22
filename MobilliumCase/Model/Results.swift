//
//  Model.swift
//  MobilliumCase
//
//  Created by Yavuz BİTMEZ on 20.02.2021.
//
import ObjectMapper
import Foundation

struct Results : Mappable{
    
    var id:Int?
    var original_title:String?
    var overview:String?
    var poster_path:String?
    var release_date:String?
    var vote_average:Int?
    var backdrop_path:String?
    var imdb_id:String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        original_title <- map["original_title"]
        overview <- map["overview"]
        poster_path <- map["poster_path"]
        release_date <- map["release_date"]
        vote_average <- map["vote_average"]
        backdrop_path <- map["backdrop_path"]
        imdb_id <- map["imdb_id"]

    }

}
