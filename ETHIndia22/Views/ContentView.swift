//
//  ContentView.swift
//  ETHIndia22
//
//  Created by Shahab Hashmi on 03/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PluginListView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Plugins")
                }
            
            WidgetListView()
                .tabItem {
                    Image(systemName: "tv.fill")
                    Text("Widgets")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }.environmentObject(PluginListViewModel())
    }
}
