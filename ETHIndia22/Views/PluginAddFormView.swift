//
//  PluginAddFormView.swift
//  ETHIndia22
//
//  Created by Shahab Hashmi on 03/12/22.
//

import SwiftUI

struct PluginAddFormView: View {
    @EnvironmentObject var pluginListViewModel: PluginListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var name = "";
    @State var queryURL = "";
    @State var vizualization = "";
    @State var paramName = "";
    @State var interval = 0;
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Configure Widget")){
                    Text("Name").font(.headline)
                    TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $name)
                    Text("Query URL").font(.headline)
                    TextField("Enter query URL", text: $queryURL)
                    Text("Type")
                    TextField("Enter type of Widget", text: $vizualization)
                }
                Section(header: Text("Configure Parameters")){
                    Text("Enter Parameter Name")
                    TextField("Param Name", text: $paramName)
                    Text("")
                }
                
            }
        }
    }
    
    func saveButtonPressed() {
        let newPlugin = PluginModel(name: name, queryURL: queryURL, vizualization: vizualization, interval: interval, parameters: [])
        pluginListViewModel.addPlugin(plugin: newPlugin)
        presentationMode.wrappedValue.dismiss()
    }
}

struct PluginAddFormView_Previews: PreviewProvider {
    static var previews: some View {
        PluginAddFormView()
    }
}
