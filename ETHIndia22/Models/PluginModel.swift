//
//  PluginModel.swift
//  ETHIndia22
//
//  Created by Shahab Hashmi on 03/12/22.
//

import Foundation

struct PluginModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let queryURL: String
    let vizualization: Array<String>
}
