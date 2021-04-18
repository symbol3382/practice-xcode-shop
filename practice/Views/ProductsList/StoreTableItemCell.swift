//
//  StoreTableItemCellTableViewCell.swift
//  practice
//
//  Created by Gourav Verma on 18/04/21.
//

import UIKit

class StoreTableItemCell: UITableViewCell {
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var categoryCell: UILabel!
    @IBOutlet weak var priceCell: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var addToBagBtn: UIButton!
    
    @IBAction func addToBagBtnAction(_ sender: UIButton) {
        print("\(sender.tag) id is selected")
        let id: Int = sender.tag
        let item = Product.getItemById(id)!;
        addItemInSelectedItems(item.id);
    }
    
    func addItemInSelectedItems(_ id: Int) {
        let defaults = UserDefaults.standard
        var currentSelectedItems = defaults.array(forKey: "selectedItems") as? [Int] ?? [];
        if currentSelectedItems.firstIndex(of: id) == nil {
            currentSelectedItems.append(id);
        }
        defaults.set(currentSelectedItems, forKey: "selectedItems");
        print("Current selected items: ", currentSelectedItems);
    }
    
    func fetchAllItems() -> [Product] {
        let defaults = UserDefaults.standard;
        return defaults.object(forKey: "allItems") as? [Product] ?? [];
    }
    
}
