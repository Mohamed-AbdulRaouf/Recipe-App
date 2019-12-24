//
//  SearchItem.swift
//  CustomSearchField
//
//  Created by Emrick Sinitambirivoutin on 20/02/2019.
//  Copyright © 2019 Emrick Sinitambirivoutin. All rights reserved.
//

import Foundation

class SearchItem {
    var attributedSearchTitle: NSMutableAttributedString?
    var allAttributedName : NSMutableAttributedString?
    
    var searchTitle: String
    
    
    public init(searchTitle: String) {
        self.searchTitle = searchTitle
        
    }
    
    public func getFormatedText() -> NSMutableAttributedString{
        allAttributedName = NSMutableAttributedString()
        allAttributedName!.append(attributedSearchTitle!)
        print(allAttributedName!)
        return allAttributedName!
    }
    
    public func getStringText() -> String{
        return "\(searchTitle)"
    }
    
}
