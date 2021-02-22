//
//  Model.swift
//  MobilliumCase
//
//  Created by Yavuz BİTMEZ on 20.02.2021.
//
import ObjectMapper
import Foundation

struct Model : Mappable {
    var results:[Results]?

    init?(map: Map) {    }
    
    mutating func mapping(map: Map) {
        results <- map["results"]

    }
    
    
}
