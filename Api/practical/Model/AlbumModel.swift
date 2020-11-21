//
//  Result.swift
//  practical
//
//  Created by Nirav  on 16/11/20.
//

import Foundation

// MARK: - AlbumModel
struct AlbumModel: Codable {
    let resultCount: Int?
    let results: [Results]?
}

// MARK: - Result
struct Results: Codable {
    let wrapperType: WrapperType?
    let kind: Kind?
    let collectionID, trackID: Int?
    let artistName, collectionName, trackName, collectionCensoredName: String?
    let trackCensoredName: String?
    let collectionArtistID: Int?
    let collectionArtistViewURL, collectionViewURL, trackViewURL: String?
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String?
    let collectionPrice, trackPrice, trackRentalPrice, collectionHDPrice: Double?
    let trackHDPrice, trackHDRentalPrice: Double?
//    let releaseDate: Date?
//    let collectionExplicitness, trackExplicitness: Explicitness?
    let discCount, discNumber, trackCount, trackNumber: Int?
    let trackTimeMillis: Int?
    let country: Country?
    let currency: Currency?
    let primaryGenreName, contentAdvisoryRating, longDescription: String?
    let hasITunesExtras: Bool?
    let shortDescription: String?
    let artistID: Int?
    let collectionArtistName: String?
    let artistViewURL: String?
    let isStreamable: Bool?
    let copyright, resultDescription: String?
    let amgArtistID: Int?

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case collectionArtistID = "collectionArtistId"
        case collectionArtistViewURL = "collectionArtistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, longDescription, hasITunesExtras, shortDescription
        case artistID = "artistId"
        case collectionArtistName
        case artistViewURL = "artistViewUrl"
        case isStreamable, copyright
        case resultDescription = "description"
        case amgArtistID = "amgArtistId"
    }
}

enum Explicitness: String, Codable {
    case notExplicit = "notExplicit"
}

enum Country: String, Codable {
    case usa = "USA"
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum Kind: String, Codable {
    case featureMovie = "feature-movie"
    case song = "song"
}

enum WrapperType: String, Codable {
    case audiobook = "audiobook"
    case track = "track"
}
