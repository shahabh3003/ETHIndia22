//
//  ETHIndia22App.swift
//  ETHIndia22
//
//  Created by Shahab Hashmi on 03/12/22.
//

import SwiftUI

@main
struct ETHIndia22App: App {
    @StateObject var pluginListViewModel: PluginListViewModel = PluginListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(pluginListViewModel)
        }
    }
}
