//
//  ContentView.swift
//  Combin_Login
//
//  Created by hesper on 2023-02-25(Sat).
//

import SwiftUI

struct DefaultView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultView()
    }
}
