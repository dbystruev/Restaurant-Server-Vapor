import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        "Apple Restaurant API"
    }
    
    // Get categories
    router.get("categories") { req in
        Categories.all
    }
    
    // Get menu items
    router.get("menu") { req -> MenuItems in
        if let category = try? req.query.get(String.self, at: "category") {
            let items = MenuItems.all.items.filter { $0.category == category }
            return MenuItems(items: items)
        } else {
            return MenuItems.all
        }
    }
    
    // Post menu IDs
    router.post("order") { req in
        return try req.content.decode([String: [Int]].self).map(to: PreparationTime.self) { itemIds in
            guard let ids = itemIds["menuIds"] else { throw Abort(.badRequest) }
            let items = MenuItems.all.items
            let times = ids.compactMap { id -> Int? in
                guard let item = items.first(where: { $0.id == id }) else { return nil }
                return item.preparationTime
            }
            let prepTime = 5 + (times.max() ?? 0)
            return PreparationTime(prepTime: prepTime)
        }
    }
}
