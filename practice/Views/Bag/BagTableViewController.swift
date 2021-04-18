//
//  BagTableViewController.swift
//  practice
//
//  Created by Gourav Verma on 18/04/21.
//

import UIKit

class BagTableViewController: UITableViewController {
    
    var items: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadBagData();
        
        
        let footerVIew = tableView.dequeueReusableCell(withIdentifier: "BagTableFooter") as! BagTableFooterCell
        footerVIew.totalItem.text = self.getFooterString()
        tableView.tableFooterView = footerVIew
      
    }
    
    func  loadBagData() {
        let defaults = UserDefaults.standard
        let currentSelectedItems = defaults.array(forKey: "selectedItems") as? [Int] ?? [];
        let allItems: [Product] = Product.getAllItems()
           
        for item in allItems {
            if currentSelectedItems.contains(item.id) {
                self.items.append(item);
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BagItemCell", for: indexPath) as! BagItemTableCell
        
        cell.bagItemTitle.text = items[indexPath.row].title;
        cell.bagItemCategory.text = items[indexPath.row].category;
        cell.bagItemPrice.text = "\(items[indexPath.row].price)";
        cell.bagItemImage.image = UIImage(data: items[indexPath.row].prepareCellImageData())
        // Configure the cell...

        return cell
    }

    func getFooterString()-> String {
        var total: Int = 0
        
        for item in self.items {
            total = total + item.price
        }
        
        return "Total \(items.count) items price: \(total)"
    }

}
