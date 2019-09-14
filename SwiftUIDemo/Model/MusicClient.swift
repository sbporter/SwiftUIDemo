//
//  MusicClient.swift
//  SwiftUIDemo
//
//  Created by Seth Porter on 9/13/19.
//  Copyright © 2019 Seth Porter. All rights reserved.
//

import SwiftUI
import Combine

class MusicClient: ObservableObject {
    @Published var artists: [Artist]
    
    init() {
        artists = [Artist.generateArtist(name: "Oiled Lift", color: Color.red, image: Image(systemName: "rosette")),
                   Artist.generateArtist(name: "Airplane Hangar", color: Color.orange, image: Image(systemName: "paperplane")),
                   Artist.generateArtist(name: "Dumpster Fire", color: Color.yellow, image: Image(systemName: "trash")),
                   Artist.generateArtist(name: "The Open Books", color: Color.green, image: Image(systemName: "book")),
                   Artist.generateArtist(name: "Arctic Sunrise", color: Color.blue, image: Image(systemName: "sunrise")),
                   Artist.generateArtist(name: "Dead Zone", color: Color.purple, image: Image(systemName: "wifi.exclamationmark")),
                   Artist.generateArtist(name: "The Mechanics", color: Color.red, image: Image(systemName: "wrench")),
                   Artist.generateArtist(name: "Reckless Drivers", color: Color.orange, image: Image(systemName: "speedometer")),
                   Artist.generateArtist(name: "The Bass Machine", color: Color.yellow, image: Image(systemName: "hifispeaker")),
                   Artist.generateArtist(name: "Genius Coconuts", color: Color.green, image: Image(systemName: "person.3")),
                   Artist.generateArtist(name: "Moondancers", color: Color.blue, image: Image(systemName: "moon")),
                   Artist.generateArtist(name: "Whole Wide World", color: Color.purple, image: Image(systemName: "globe")),
                   Artist.generateArtist(name: "The Commanders", color: Color.red, image: Image(systemName: "command"))].sorted(by: { $0.name < $1.name })
    }
}

class Player: ObservableObject {
    @Published var playbackPosition: TimeInterval = 0
    @Published var duration: TimeInterval = 100
}

struct Song: Identifiable {
    var id: UUID
    var name: String
    var artist: String
    var color: Color
    var image: Image
    var duration: TimeInterval
}

struct Artist: Identifiable {
    var id: UUID
    var name: String
    var artistColor: Color
    var image: Image
    var songs: [Song]
    
    static func generateArtist(name: String, color: Color, image: Image) -> Artist {
        let songs = [Song(id: UUID(), name: "Pouring Rain", artist: name, color: color, image: image, duration: 213),
                     Song(id: UUID(), name: "Live Forever", artist: name, color: color, image: image, duration: 423),
                     Song(id: UUID(), name: "Endless Summer", artist: name, color: color, image: image, duration: 401),
                     Song(id: UUID(), name: "Around the Corner", artist: name, color: color, image: image, duration: 265),
                     Song(id: UUID(), name: "Breathing Underwater", artist: name, color: color, image: image, duration: 312),
                     Song(id: UUID(), name: "Only Thing I Need", artist: name, color: color, image: image, duration: 157),
                     Song(id: UUID(), name: "Fever", artist: name, color: color, image: image, duration: 281),
                     Song(id: UUID(), name: "Renegades", artist: name, color: color, image: image, duration: 199),
                     Song(id: UUID(), name: "Swamp", artist: name, color: color, image: image, duration: 255),
                     Song(id: UUID(), name: "Everything's Gonna Be Alright", artist: name, color: color, image: image, duration: 256),
                     Song(id: UUID(), name: "Stereo", artist: name, color: color, image: image, duration: 289),
                     Song(id: UUID(), name: "Noises", artist: name, color: color, image: image, duration: 321),
                     Song(id: UUID(), name: "Slow Down", artist: name, color: color, image: image, duration: 367)]
        return Artist(id: UUID(), name: name, artistColor: color, image: image, songs: songs)
    }
}


