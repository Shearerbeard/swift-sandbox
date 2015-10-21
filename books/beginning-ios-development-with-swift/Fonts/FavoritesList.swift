//
//  FavoritesList.swift
//  Fonts
//
//  Created by Michael Shearer on 10/20/15.
//  Copyright © 2015 Michael Shearer. All rights reserved.
//

import Foundation
import UIKit

class FavortiesList {
    class var sharedFavoritesList: FavortiesList {
        struct Singleton {
            static let instance = FavortiesList()
        }
        
        return Singleton.instance
    }
    
    private(set) var favorites: [String]
    
    init() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let storedFavorites = defaults.objectForKey("favorites") as? [String]
        
        favorites = storedFavorites != nil ? storedFavorites! : []
    }
    
    func addFavorite(fontName: String) {
        if(favorites.contains(fontName)) {
            favorites.append(fontName)
            saveFavorites()
        }
    }
    
    func  removeFavorite(fontName: String) {
        if let index = favorites.indexOf(fontName) {
            favorites.removeAtIndex(index)
            saveFavorites()
        }
    }
    
    func saveFavorites() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(favorites, forKey: "favorites")
        defaults.synchronize()
    }
}
