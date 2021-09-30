//
//  FavoriteButton.swift
//  iDine
//
//  Created by Nikola Anastasovski on 30.9.21.
//

import SwiftUI

struct FavoriteButton: View {
    @State var favorited = false
    var onFavorited: () -> Void
    var onUnfavorited: () -> Void
    var imageName: String {
        favorited ? "star.fill" : "star"
    }
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .foregroundColor(.yellow)
                .imageScale(.large)
        }
        .onTapGesture {
            favorited.toggle()
            if favorited {
                onFavorited()
            } else {
                onUnfavorited()
            }
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(onFavorited: { }, onUnfavorited: { }) 
    }
}
