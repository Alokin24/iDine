//
//  Favorites.swift
//  iDine
//
//  Created by Nikola Anastasovski on 30.9.21.
//

import Foundation

class Favorites: ObservableObject {
    @Published var favorites: [MenuItem] = []
    
    func add(item: MenuItem) {
        favorites.append(item)
    }
    
    func delete(item: MenuItem) {
        favorites.removeAll { $0 == item }
    }
    
    func contains(item: MenuItem) -> Bool {
        favorites.contains(item)
    }
}
