//
//  ViewController.swift
//  FavouriteCurrency
//
//  Created by admin on 17/05/16.
//  Copyright © 2016 onyangowilly. All rights reserved.
//

import UIKit

    class ViewController: UITableViewController,CurrencyStoreDelegate {
       
        var currencyStore: CurrencyStore!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            currencyStore = CurrencyStore(delegate: self)
        }
        
        func newInfoArrived() {
        self.tableView.reloadData()
    }
        
        override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return currencyStore.count
        }
        
        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            let sectionObject = currencyStore[section]
            return sectionObject.count
        }
        
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
            
            
            let currencyObject = currencyStore[indexPath.section]
            let currency = currencyObject[indexPath.row]
            cell.textLabel?.text = currency.base
           // cell.detailTextLabel?.text = Currency.
            
            return cell
        }
        
        override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            let sectionObject = currencyStore[section]
            return sectionObject.Currencyname
        }
    }






