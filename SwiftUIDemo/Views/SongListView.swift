//
//  SongListView.swift
//  SwiftUIDemo
//
//  Created by Seth Porter on 9/13/19.
//  Copyright © 2019 Seth Porter. All rights reserved.
//

import SwiftUI

struct SongListView: View {
    @State var artist: Artist
    
    var body: some View {
        List(artist.songs) { song in
            NavigationLink(destination: PlaybackView(song: song)) {
                SongCell(song: song)
            }
        }
        .navigationBarTitle(artist.name)
    }
}

struct SongCell: View {
    @State var song: Song
    
    let durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.maximumUnitCount = 2
        return formatter
    }()
    
    var body: some View {
        HStack {
            AlbumView(color: song.color, image: song.image)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text("\(song.name)")
                    .font(.headline)
                Text("\(song.artist)")
                    .font(.subheadline)
            }
            Spacer()
            Text(durationFormatter.string(from: song.duration)!)
                .font(.subheadline)
        }
    }
}



struct SongList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SongListView(artist: Artist.generateArtist(name: "Test Artist", color: Color.red, image: Image(systemName: "wrench")))
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .environment(\.colorScheme, .light)
            SongListView(artist: Artist.generateArtist(name: "Test Artist", color: Color.red, image: Image(systemName: "wrench")))
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .environment(\.colorScheme, .dark)
            SongListView(artist: Artist.generateArtist(name: "Test Artist", color: Color.red, image: Image(systemName: "wrench")))
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .environment(\.colorScheme, .light)
        }
    }
}
