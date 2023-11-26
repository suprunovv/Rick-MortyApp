//
//  EpisodeModel.swift
//  RickAndMortyApp
//
//  Created by MacBookPro on 19.11.2023.
//

import Foundation
import UIKit

struct PersonModel {
    let personName: String
    let nameEpisode: String
    let image: UIImage
    let nomberEpisode: String
    var like = false
    let status: String
    let species: String
    let gender: String
    let id: String
}

struct Result: Codable {
    var id: Int?
    var episode: String?
    var characters: [String]?
    var url: String?
    var created: String?
    var name: String?
}

struct Episod: Codable {
    var results: [Result]?
}


struct Characters: Codable {
    var id: Int?
    var name: String?
    var status: String?
    var species: String?
    var gender: String?
    var image: String?
}

