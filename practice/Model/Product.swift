//
//  Product.swift
//  practice
//
//  Created by Gourav Verma on 18/04/21.
//

import UIKit

class Product: Codable {
    var id:Int = 0;
    var imageUrl: String = "";
    var title: String = "";
    var price: Int = 0;
    var category: String = "";
    
    init(id: Int, imageUrl: String, title: String, price: Int, category: String) {
        self.id = id;
        self.imageUrl = imageUrl;
        self.title = title;
        self.price = price;
        self.category = category;
    }
    
    static func getAllItems() -> [Product] {
        let defaults = UserDefaults.standard;
        let savedJsonData = defaults.value(forKey: "allItems") as? String ?? "[]";
        let savedData = Data(savedJsonData.utf8);
        let decorder = JSONDecoder();
        do {
            let result = try decorder.decode([Product].self, from: savedData);
            return result;
        } catch {
            print(error.localizedDescription);
            print(savedData);
            print(savedJsonData);
        }
        return [];
    }
    
    static func getItemById(_ id: Int) -> Product? {
        let allItems = Product.getAllItems();
        for item in allItems {
            if item.id == id {
                return item
            }
        }
        return nil;
    }
    
    func prepareCellImageData() -> Data {
        let imageUrl: URL = URL(string: self.imageUrl)!
        let imageData = try! Data(contentsOf: imageUrl)
        return imageData;
    }
}
