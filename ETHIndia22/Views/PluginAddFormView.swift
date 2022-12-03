//
//  PluginAddFormView.swift
//  ETHIndia22
//
//  Created by Shahab Hashmi on 03/12/22.
//

import SwiftUI

struct PluginAddFormView: View {
    var body: some View {
        VStack{
            formElements();
        }
    }
}

struct formElements: View {
    @State var name = "";
    @State var queryURL = "";
    
    var body: some View {
        Form {
            Section(header: Text("Configure Widget")){
                Text("Name").font(.headline)
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $name)
                Text("Query URL").font(.headline)
                TextField("Enter query URL", text: $queryURL)
            }
        }
    }
}


struct PluginAddFormView_Previews: PreviewProvider {
    static var previews: some View {
        PluginAddFormView()
    }
}
