//
//  PluginListViewModel.swift
//  ETHIndia22
//
//  Created by Shahab Hashmi on 03/12/22.
//

import Foundation

class PluginListViewModel: ObservableObject {
    @Published var plugins: [PluginModel] = []
    init() {
        plugins.append(contentsOf: getDemoPlugins())
    }
    
    func getDemoPlugins() -> [PluginModel] {
        let demoPlugins: [PluginModel] = [
            PluginModel(name: "Plugin-1", queryURL: "example.com", vizualization: []),
            PluginModel(name: "Plugin-2", queryURL: "not.com", vizualization: [])
        ]
        return demoPlugins
    }
    
    func addPlugin(plugin: PluginModel) {
        plugins.append(plugin)
    }
}
