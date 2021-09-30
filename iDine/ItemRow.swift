//
//  ItemRow.swift
//  iDine
//
//  Created by Nikola Anastasovski on 30.9.21.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    
    var body: some View {
        Text(item.name)
    }
}

//struct ItemRow_Previews: PreviewProvider {
//    static var previews: some View {
//        
//    }
//}
