//
//  PluginView.swift
//  ETHIndia22
//
//  Created by Shahab Hashmi on 03/12/22.
//

import SwiftUI


struct PluginListView: View {
    @State var plugins = ["Dummy Plugin 1", "Dummy Plugin 2"]
    var body: some View {
        NavigationView{
            List {
                ForEach(plugins, id: \.self) { plugin in
                    Text(plugin)
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
        }
        
    }
}
