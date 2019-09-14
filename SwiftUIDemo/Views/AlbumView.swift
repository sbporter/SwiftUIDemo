//
//  AlbumView.swift
//  SwiftUIDemo
//
//  Created by Seth Porter on 9/13/19.
//  Copyright © 2019 Seth Porter. All rights reserved.
//

import SwiftUI

struct AlbumView: View {
    @State var color: Color
    @State var image: Image
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(LinearGradient(gradient: Gradient(colors: [self.color.opacity(0.4), self.color]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .shadow(radius: 3)
                self.image
                    .resizable()
                    .foregroundColor(.white)
                    .opacity(0.7)
                    .shadow(color: Color.white, radius: 5, x: 2, y: 2)
                    .imageScale(.large)
                    .padding(geometry.size.width * 0.1)
            }
        }
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView(color: Color.red, image: Image(systemName: "moon"))
    }
}
