//
//  FavouriteCurrency.swift
//  FavouriteCurrency
//
//  Created by admin on 17/05/16.
//  Copyright © 2016 onyangowilly. All rights reserved.
//

import Foundation
struct FavouriteCurrency {
    let base: String
    let date: NSData
    let rate: Double
    
    init?(CurrencyDictonary: [String: AnyObject]) {
        if let base = CurrencyDictonary["base"] as? String,let date = CurrencyDictonary["date"] as? NSData,let rate = CurrencyDictonary["rate"] as? Double {
            self.base = base
            self.date = date
            self.rate = rate
        } else {
            return nil
        }
    }
}