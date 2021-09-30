//
//  iDineApp.swift
//  iDine
//
//  Created by Nikola Anastasovski on 30.9.21.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
