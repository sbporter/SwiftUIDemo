//
//  PlaybackView.swift
//  SwiftUIDemo
//
//  Created by Seth Porter on 9/13/19.
//  Copyright © 2019 Seth Porter. All rights reserved.
//

import SwiftUI

struct PlaybackView: View {
    @State var song: Song
    
    @State private var position: TimeInterval = 0
    @State private var playing: Bool = true
    
    let durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.maximumUnitCount = 2
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.playing && (self.position < self.song.duration) {
                self.position += 1
            } else {
                self.playing = false
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Spacer()
            GeometryReader { geometry in
                VStack {
                    HStack {
                        AlbumView(color: self.song.color, image: self.song.image)
                            .frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.8)
                    }
                    Text(self.song.name)
                        .font(.title)
                    Text(self.song.artist)
                        .font(.subheadline)
                }
            }
            Spacer()
            VStack {
                Slider(value: $position, in: 0...song.duration)
                    .accentColor(song.color)
                HStack {
                    Text(durationFormatter.string(from: position)!)
                    Spacer()
                    Text(durationFormatter.string(from: song.duration)!)
                }
            }
            HStack(spacing: 50) {
                Button(action: {
                    self.position = 0
                }) {
                    Image(systemName: "backward.fill")
                        .resizable()
                        .imageScale(.large)
                        .accentColor(song.color)
                        .frame(width: 50, height: 50)
                }
                Button(action: {
                    self.playing.toggle()
                }) {
                    if playing {
                        Image(systemName: "pause.fill")
                            .resizable()
                            .imageScale(.large)
                            .accentColor(song.color)
                            .frame(width: 50, height: 50)
                    } else {
                        Image(systemName: "play.fill")
                            .resizable()
                            .imageScale(.large)
                            .accentColor(song.color)
                            .frame(width: 50, height: 50)
                    }
                }
                Button(action: {
                    self.position = self.song.duration
                }) {
                    Image(systemName: "forward.fill")
                        .resizable()
                        .imageScale(.large)
                        .accentColor(song.color)
                        .frame(width: 50, height: 50)
                }
            }
        }
    .padding()
        .onAppear {
            let _ = self.timer
        }
    }
}

struct PlaybackView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlaybackView(song: Song(id: UUID(), name: "Only Thing I Need", artist: "Arctic Sunrise", color: Color.blue, image: Image(systemName: "sunrise"), duration: 317))
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .environment(\.colorScheme, .light)
            PlaybackView(song: Song(id: UUID(), name: "Only Thing I Need", artist: "Arctic Sunrise", color: Color.blue, image: Image(systemName: "sunrise"), duration: 317))  .previewDevice(PreviewDevice(rawValue: "iPhone XS"))
                .environment(\.colorScheme, .dark)
            PlaybackView(song: Song(id: UUID(), name: "Only Thing I Need", artist: "Arctic Sunrise", color: Color.blue, image: Image(systemName: "sunrise"), duration: 317))
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .environment(\.colorScheme, .light)
        }
    }
}
