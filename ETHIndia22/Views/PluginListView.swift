//
//  PluginView.swift
//  ETHIndia22
//
//  Created by Shahab Hashmi on 03/12/22.
//

import SwiftUI
import Foundation

struct PluginListView: View {
    @EnvironmentObject var pluginListViewModel: PluginListViewModel
    var body: some View {
        NavigationView{
            List {
                ForEach(pluginListViewModel.plugins) { plugin in
                    PluginListRowView(plugin: plugin)
                }
                //                    ScrollView {
                //                        Text("Plugins will appear here!!!")
                //                            .padding()
                //                    }
                //                    Button(action: {
                //                        //Place your action here
                //                        // print("btn clicked!!!")
                //                    }) {
                //                        NavigationView {
                //                            NavigationLink(destination: formView()) {
                //                                Image(systemName: "plus.circle.fill")
                //                                    .font(.system(size: 60))
                //                                    .foregroundColor(.purple)
                //                                    .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                //                                    .padding()
                //                            }
                //                        }
                //                    }
                
            }
            .navigationTitle("Plugins")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    NavigationLink("Add Plugin", destination: PluginAddFormView())
            )
        }
        
    }
}

struct PluginListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PluginListView()
        }.environmentObject(PluginListViewModel())
        
    }
}
