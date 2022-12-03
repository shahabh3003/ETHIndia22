//
//  PluginListRowView.swift
//  ETHIndia22
//
//  Created by Shahab Hashmi on 03/12/22.
//

import SwiftUI

struct PluginListRowView: View {
    let plugin: PluginModel
    var body: some View {
        Text(plugin.name)
    }
}

struct PluginListRowView_Previews: PreviewProvider {
    static let plugin = PluginModel(name: "Plugin 1", queryURL: "QueryOnThis.com", vizualization: "[]", interval: 0, parameters: [])
    static var previews: some View {
        PluginListRowView(plugin: plugin)
    }
}
