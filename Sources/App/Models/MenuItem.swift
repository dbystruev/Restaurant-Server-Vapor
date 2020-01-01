//
//  MenuItem.swift
//  App
//
//  Created by Denis Bystruev on 01.01.2020.
//

import Vapor

struct MenuItem: Content {
    let id: Int
    let name: String
    let detailText: String
    let price: Double
    let category: String
    let imageURL: URL?
    let preparationTime: Int
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        id = try valueContainer.decode(Int.self, forKey: CodingKeys.id)
        name = try valueContainer.decode(String.self, forKey: CodingKeys.name)
        detailText = try valueContainer.decode(String.self, forKey: CodingKeys.detailText)
        price = try valueContainer.decode(Double.self, forKey: CodingKeys.price)
        category = try valueContainer.decode(String.self, forKey: CodingKeys.category)
        imageURL = URL(string: "http://localhost:8090/images/\(id).png")!
        preparationTime = try valueContainer.decode(Int.self, forKey: CodingKeys.preparationTime)
        
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case detailText = "description"
        case price
        case category
        case imageURL = "image_url"
        case preparationTime = "estimated_prep_time"
    }
}
