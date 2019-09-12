//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Seth Porter on 9/11/19.
//  Copyright © 2019 Seth Porter. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        Text("Hello World")
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
