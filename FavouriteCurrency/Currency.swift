//
//  Currency.swift
//  FavouriteCurrency
//
//  Created by admin on 17/05/16.
//  Copyright © 2016 onyangowilly. All rights reserved.
//

import Foundation
struct Currency{
    let Currencyname: String
    private let currency: [FavouriteCurrency]
    
    init(Currencyname: String, currencyList: [ [ String: AnyObject]]) {
        let currency = currencyList.map(FavouriteCurrency.init).flatMap({ $0 })
        
        self.Currencyname = Currencyname
        self.currency = currency
        
    }
    
    var count: Int {
        return currency.count
    }
    
    subscript(index: Int) -> FavouriteCurrency {
        return currency[index]
    }
}