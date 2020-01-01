//
//  MenuItems.swift
//  App
//
//  Created by Denis Bystruev on 02.01.2020.
//

import Vapor

struct MenuItems: Content {
    let items: [MenuItem]
}

extension MenuItems {
    // MARK: - Default data
    static var all: MenuItems {
        let data = """
        [
            {
                "id": 1,
                "name": "Spaghetti and Meatballs",
                "description": "Seasoned meatballs on top of freshly-made spaghetti. Served with a robust tomato sauce.",
                "price": 9.0,
                "category": "entrees",
                "estimated_prep_time": 20
            },
            {
                "id": 2,
                "name": "Margherita Pizza",
                "description": "Tomato sauce, fresh mozzarella, basil, and extra-virgin olive oil.",
                "price": 10.0,
                "category": "entrees",
                "estimated_prep_time": 30
            },
            {
                "id": 3,
                "name": "Grilled Steelhead Trout",
                "description": "Pacific steelhead trout with lettuce, tomato, and red onion.",
                "price": 12.75,
                "category": "entrees",
                "estimated_prep_time": 15
            },
            {
                "id": 4,
                "name": "Ham and mushroom ravioli",
                "description": "House-made ravioli filled with pine nuts, parmesan, ham, and mushrooms. Served over tomato sauce.",
                "price": 8.0,
                "category": "appetizers",
                "estimated_prep_time": 12
            },
            {
                "id": 5,
                "name": "Chicken Noodle Soup",
                "description": "Chicken simmered alongside yellow onions, carrots, celery, and bay leaves.",
                "price": 3.5,
                "category": "soups",
                "estimated_prep_time": 5
            },
            {
                "id": 6,
                "name": "Italian Salad",
                "description": "Garlic, red onions, tomatoes, mushrooms, and olives on top of romaine lettuce.",
                "price": 5.0,
                "category": "salads",
                "estimated_prep_time": 5
            }
        ]
        """
        let decoder = JSONDecoder()
        let items = try! decoder.decode([MenuItem].self, from: data)
        return MenuItems(items: items)
    }
}
