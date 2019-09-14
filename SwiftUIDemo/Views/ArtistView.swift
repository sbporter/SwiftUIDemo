//
//  Artist.swift
//  SwiftUIDemo
//
//  Created by Seth Porter on 9/13/19.
//  Copyright © 2019 Seth Porter. All rights reserved.
//

import SwiftUI

struct ArtistView: View {
    @ObservedObject var client: MusicClient
    
    var body: some View {
        NavigationView {
            List(client.artists) { artist in
                NavigationLink(destination: SongListView(artist: artist)) {
                    ArtistCell(artist: artist)
                }
            }
            .navigationBarTitle("Artists")
        }
    }
}

struct ArtistCell: View {
    @State var artist: Artist
    
    var body: some View {
        HStack {
            AlbumView(color: artist.artistColor, image: artist.image)
                .frame(width: 50, height: 50)
            Text("\(artist.name)")
                .font(.title)
        }
    }
}

struct Artist_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ArtistView(client: MusicClient())
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .environment(\.colorScheme, .light)
            ArtistView(client: MusicClient())
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .environment(\.colorScheme, .dark)
            ArtistView(client: MusicClient())
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .environment(\.colorScheme, .light)
        }
    }
}
