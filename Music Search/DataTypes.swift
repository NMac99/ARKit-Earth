//
//  DataTypes.swift
//  Music Search
//
//  Created by Narek Arsenyan on 5/6/21.
//  Copyright © 2021 Narek Arsenyan. All rights reserved.
//

import Foundation

import UIKit


enum LanguageType {
    case Armenian
    case English
    case Russian
    case Spanish
}

struct Artist {
    let name: String
    let surname: String
    let searchText: String
    var fullname: String {
        return name + " " + surname
    }
}

struct Language {
    let language: LanguageType
    let artists: [Artist]
    let pic: UIImage
}

struct ResultData: Codable {
    let resultCount: Int
    let results: [SongData]
}

struct SongData: Codable {
    let wrapperType: String
    let kind: String
    let artistId: Int64
    let collectionId: Int64
    let trackId: Int64
    let artistName: String
    let collectionName: String
    let trackName: String
    let collectionCensoredName: String
    let trackCensoredName: String
    let artistViewUrl: String
    let collectionViewUrl: String
    let trackViewUrl: String
    let previewUrl: String
    let artworkUrl30: String
    let artworkUrl60: String
    let artworkUrl100: String
    var collectionPrice: Double
    var trackPrice: Double
    let releaseDate: String
    let collectionExplicitness: String
    let trackExplicitness: String
    let discCount: Int
    let discNumber: Int
    let trackCount: Int
    let trackNumber: Int
    let trackTimeMillis: Int
    let country: String
    let currency: String
    let primaryGenreName: String
    let isStreamable: Bool
    
    private enum CodingKeys: String, CodingKey {
        case wrapperType = "wrapperType"
        case kind = "kind"
        case artistId = "artistId"
        case collectionId = "collectionId"
        case trackId = "trackId"
        case artistName = "artistName"
        case collectionName = "collectionName"
        case trackName = "trackName"
        case collectionCensoredName = "collectionCensoredName"
        case trackCensoredName = "trackCensoredName"
        case artistViewUrl = "artistViewUrl"
        case collectionViewUrl = "collectionViewUrl"
        case trackViewUrl = "trackViewUrl"
        case previewUrl = "previewUrl"
        case artworkUrl30 = "artworkUrl30"
        case artworkUrl60 = "artworkUrl60"
        case artworkUrl100 = "artworkUrl100"
        case collectionPrice = "collectionPrice"
        case trackPrice = "trackPrice"
        case releaseDate = "releaseDate"
        case collectionExplicitness = "collectionExplicitness"
        case trackExplicitness = "trackExplicitness"
        case discCount = "discCount"
        case discNumber = "discNumber"
        case trackCount = "trackCount"
        case trackNumber = "trackNumber"
        case trackTimeMillis = "trackTimeMillis"
        case country = "country"
        case currency = "currency"
        case primaryGenreName = "primaryGenreName"
        case isStreamable = "isStreamable"
    }
    init(from decoder: Decoder) throws {
        let conteiner = try decoder.container(keyedBy: CodingKeys.self)
        wrapperType = try conteiner.decode(String.self, forKey: .wrapperType)
        kind = try conteiner.decode(String.self, forKey: .kind)
        artistId = try conteiner.decode(Int64.self, forKey: .artistId)
        collectionId = try conteiner.decode(Int64.self, forKey: .collectionId)
        trackId = try conteiner.decode(Int64.self, forKey: .trackId)
        artistName = try conteiner.decode(String.self, forKey: .artistName)
        collectionName = try conteiner.decode(String.self, forKey: .collectionName)
        trackName = try conteiner.decode(String.self, forKey: .trackName)
        collectionCensoredName = try conteiner.decode(String.self, forKey: .collectionCensoredName)
        trackCensoredName = try conteiner.decode(String.self, forKey: .trackCensoredName)
        artistViewUrl = try conteiner.decode(String.self, forKey: .artistViewUrl)
        collectionViewUrl = try conteiner.decode(String.self, forKey: .collectionViewUrl)
        trackViewUrl = try conteiner.decode(String.self, forKey: .trackViewUrl)
        artworkUrl30 = try conteiner.decode(String.self, forKey: .artworkUrl30)
        artworkUrl60 = try conteiner.decode(String.self, forKey: .artworkUrl60)
        artworkUrl100 = try conteiner.decode(String.self, forKey: .artworkUrl100)
        releaseDate = try conteiner.decode(String.self, forKey: .releaseDate)
        collectionExplicitness = try conteiner.decode(String.self, forKey: .collectionExplicitness)
        trackExplicitness = try conteiner.decode(String.self, forKey: .trackExplicitness)
        discCount = try conteiner.decode(Int.self, forKey: .discCount)
        discNumber = try conteiner.decode(Int.self, forKey: .discNumber)
        trackCount = try conteiner.decode(Int.self, forKey: .trackCount)
        trackNumber = try conteiner.decode(Int.self, forKey: .trackNumber)
        country = try conteiner.decode(String.self, forKey: .country)
        currency = try conteiner.decode(String.self, forKey: .currency)
        primaryGenreName = try conteiner.decode(String.self, forKey: .primaryGenreName)
        isStreamable = try conteiner.decode(Bool.self, forKey: .isStreamable)
        do {
            collectionPrice = try conteiner.decode(Double.self, forKey: .collectionPrice)
        } catch {
            collectionPrice = 0.0
        }
        do {
            trackPrice = try conteiner.decode(Double.self, forKey: .trackPrice)
        } catch {
            trackPrice = 0.0
        }
        do {
            previewUrl = try conteiner.decode(String.self, forKey: .previewUrl)
        } catch {
            previewUrl = "https://upload.wikimedia.org/wikipedia/commons/d/dc/No_Preview_image_2.png"
        }
        do {
            trackTimeMillis = try conteiner.decode(Int.self, forKey: .trackTimeMillis)
        } catch {
            trackTimeMillis = 0
        }
    }
    init(wrapperType: String, kind: String, artistId: Int64, collectionId: Int64, trackId: Int64, artistName: String, collectionName: String, trackName: String, collectionCensoredName: String, trackCensoredName: String, artistViewUrl: String, collectionViewUrl: String, trackViewUrl: String, previewUrl: String, artworkUrl30: String, artworkUrl60: String, artworkUrl100: String, collectionPrice: Double,
    trackPrice: Double, releaseDate: String, collectionExplicitness: String, trackExplicitness: String, discCount: Int, discNumber: Int, trackCount: Int, trackNumber: Int, trackTimeMillis: Int, country: String, currency: String, primaryGenreName: String, isStreamable: Bool) {
        self.wrapperType = wrapperType
        self.kind = kind
        self.artistId = artistId
        self.collectionId = collectionId
        self.trackId = trackId
        self.artistName = artistName
        self.collectionName = collectionName
        self.trackName = trackName
        self.collectionCensoredName = collectionCensoredName
        self.trackCensoredName = trackCensoredName
        self.artistViewUrl = artistViewUrl
        self.collectionViewUrl = collectionViewUrl
        self.trackViewUrl = trackViewUrl
        self.previewUrl = previewUrl
        self.artworkUrl30 = artworkUrl30
        self.artworkUrl60 = artworkUrl60
        self.artworkUrl100 = artworkUrl100
        self.collectionPrice = collectionPrice
        self.trackPrice = trackPrice
        self.releaseDate = releaseDate
        self.collectionExplicitness = collectionExplicitness
        self.trackExplicitness = trackExplicitness
        self.discCount = discCount
        self.discNumber = discNumber
        self.trackCount = trackCount
        self.trackNumber = trackNumber
        self.trackTimeMillis = trackTimeMillis
        self.country = country
        self.currency = currency
        self.primaryGenreName = primaryGenreName
        self.isStreamable = isStreamable
    }
}

