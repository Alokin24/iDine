//
//  FavoritesView.swift
//  iDine
//
//  Created by Nikola Anastasovski on 30.9.21.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        NavigationView {
            List {
                ForEach(favorites.favorites) { item in
                    Text(item.name)
                }
            }
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(Favorites())
    }
}
