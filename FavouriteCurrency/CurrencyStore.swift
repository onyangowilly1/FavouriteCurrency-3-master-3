//
//  CurrencyStore.swift
//  FavouriteCurrency
//
//  Created by admin on 17/05/16.
//  Copyright © 2016 onyangowilly. All rights reserved.
//

import Foundation

protocol CurrencyStoreDelegate {
    func newInfoArrived()
}


class CurrencyStore {
    private var sections = [Currency]()
    let delegate: CurrencyStoreDelegate
    
    var count: Int {
        return sections.count
    }
    
    subscript(index: Int) -> Currency {
        return sections[index]
    }
    
    init(delegate: CurrencyStoreDelegate) {
        self.delegate = delegate
        
        let url = NSURL(string: "http://api.fixer.io/latest?base=USD")!
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            guard let data = data else {
                print("Failed to get data from the server")
                return
            }
            
            do {
                let jsonDictionary = try! NSJSONSerialization.JSONObjectWithData(data, options: []) as! [String: AnyObject]
                
            } catch let error {
                print("JSON Serialization failed. Error: \(error)")
            }
            let rate = [Currency]()
            
           // for (base, rate) in json  {
                //let section = Currency(Currencyname: base as String, currencyList: rate)
                //results.append(section)
           // }
            
            self.sections = rate.sort({ (lhs, rhs) -> Bool in
                lhs.Currencyname > rhs.Currencyname
            })
            
            NSOperationQueue.mainQueue().addOperationWithBlock({
                delegate.newInfoArrived()
            })
        }
        task.resume()
    }
}