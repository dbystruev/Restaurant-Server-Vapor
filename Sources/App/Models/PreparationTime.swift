//
//  PreparationTime.swift
//  App
//
//  Created by Denis Bystruev on 02.01.2020.
//

import Vapor

struct PreparationTime: Content {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
