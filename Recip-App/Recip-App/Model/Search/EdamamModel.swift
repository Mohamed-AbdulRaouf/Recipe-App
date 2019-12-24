//
//  edamamModel.swift
//  SoftxpertTaskApp
//
//  Created by mohamed on 12/18/19.
//  Copyright © 2019 injaz. All rights reserved.
//

import Foundation
import ObjectMapper


class EdamamModel : Mappable {
    var q : String?
    var from : Int?
    var to : Int?
    var more : Bool?
    var count : Int?
    var hits : [Hits]?
    
    init(){
        
    }
   required init?(map: Map) {
        
    }
    
     func mapping(map: Map) {
        
        q <- map["q"]
        from <- map["from"]
        to <- map["to"]
        more <- map["more"]
        count <- map["count"]
        hits <- map["hits"]
    }
    
}

