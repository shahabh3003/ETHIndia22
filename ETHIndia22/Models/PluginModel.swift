//
//  PluginModel.swift
//  ETHIndia22
//
//  Created by Shahab Hashmi on 03/12/22.
//

import Foundation

struct Parameter: Codable {
    let name: String
    let required: Bool
}

struct PluginModel: Identifiable, Codable {
    let id: String = UUID().uuidString
    let name: String
    let queryURL: String
    let vizualization: String
    let interval: Int
    let parameters: [Parameter]
}
