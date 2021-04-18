//
//  StoreTableViewController.swift
//  practice
//
//  Created by Gourav Verma on 28/03/21.
//

import UIKit

class StoreTableViewController: UITableViewController {
    let currency = "₹"
    var itemsData: [Product] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data = self.fetchItemData();
        self.saveDataToDefaults(data, "allItems")
        self.itemsData = Product.getAllItems();
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Back", style: .plain, target: nil, action: nil)
    }
    
    
    
    func fetchItemData() -> String {
        
        let data = """
            [
                {
                    "id": 100,
                    "imageUrl":"https://symbol-practice.s3.ap-south-1.amazonaws.com/nama/ring1.jpg",
                    "title": "Ring 1",
                    "price": 1000,
                    "category": "Gold Ring"
                },
                {
                    "id": 200,
                    "imageUrl":"https://symbol-practice.s3.ap-south-1.amazonaws.com/nama/ring2.jpg",
                    "title": "Ring 2",
                    "price": 2000,
                    "category": "Diamond Ring"
                },
                {
                    "id": 300,
                    "imageUrl":"https://symbol-practice.s3.ap-south-1.amazonaws.com/nama/ring3.jpg",
                    "title": "Ring 3",
                    "price": 3000,
                    "category": "Silver Ring"
                },
                {
                    "id": 412,
                    "imageUrl":"https://symbol-practice.s3.ap-south-1.amazonaws.com/nama/ring4.jpg",
                    "title": "Ring 4",
                    "price": 4000,
                    "category": "Platinum Ring"
                },
                {
                    "id": 521,
                    "imageUrl":"https://symbol-practice.s3.ap-south-1.amazonaws.com/nama/ring5.jpg",
                    "title": "Ring 5",
                    "price": 5000,
                    "category": "Titanium Ring"
                }
            ]
"""
        return data;
    }
    
    // This will store the provided item model array into provided key
    public func saveDataToDefaults(_ data: String, _ key: String) {
        let defaults = UserDefaults.standard;
        defaults.setValue(data, forKey: key)
        //        defaults.data(forKey: key);
    }
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {       
        return self.itemsData.count;
    }
    
    
    // link cell by identifier
    // now cell variable will point to a particular cell of table
    // image data preapre from static data object
    // modify cell and put data from static object to cell
    // return cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "StoreItemCell", for: indexPath) as! StoreTableItemCell
        
        let imageData = self.itemsData[indexPath.row].prepareCellImageData();
        cell = self.prepareCellForItem(cell, imageData: imageData, index: indexPath.row);
        
        return cell
    }
    
    
    //
    func prepareCellForItem(_ cell: StoreTableItemCell, imageData: Data, index: Int) -> StoreTableItemCell {
        cell.imageCell?.image = UIImage(data: imageData)
        cell.titleCell.text = self.itemsData[index].title
        cell.categoryCell.text = self.itemsData[index].category
        cell.priceCell.text = "\(self.currency) \(self.itemsData[index].price)"
        cell.priceCell.textAlignment = .right
        cell.addToBagBtn.tag = self.itemsData[index].id;
        return cell;
    }
    
    
}
