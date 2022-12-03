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
            PluginModel(name: "Plugin-1", queryURL: "example.com", vizualization: "[]", interval: 0, parameters: []),
            PluginModel(name: "Plugin-2", queryURL: "not.com", vizualization: "[]", interval: 0, parameters: [])
        ]
        return demoPlugins
    }
    
    func addPlugin(plugin: PluginModel) {
        plugins.append(plugin)
        let userDefaults = UserDefaults(suiteName: "group.knowapp")
//        let jsonEncoder = JSONEncoder()
//        let jsonData = try! jsonEncoder.encode(plugin)
//        let jsonString = String(data: jsonData, encoding: String.Encoding.utf16)
        userDefaults?.set(plugin.name, forKey: "pluginDataJSON")
    }
}
