//
//  Model.swift
//  MobilliumCase
//
//  Created by Yavuz BİTMEZ on 20.02.2021.
//
import ObjectMapper
import Foundation

struct Results : Mappable{
    
    var id:String?
    var original_title:String?
    var overview:String?
    var poster_path:String?
    var release_date:String?
    var vote_average:Int?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        
    }

}
