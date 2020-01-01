//
//  Categories.swift
//  App
//
//  Created by Denis Bystruev on 01.01.2020.
//

import Vapor

struct Categories: Content {
    let categories: [String]
}

extension Categories {
    // MARK: - Default data
    static var all: Categories {
        Categories(categories:
            [
                "appetizers",
                "salads",
                "soups",
                "entrees",
                "desserts",
                "sandwiches"
            ]
        )
    }
}
