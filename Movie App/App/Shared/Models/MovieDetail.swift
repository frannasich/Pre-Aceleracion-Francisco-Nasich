//
//  MovieDetail.swift
//  Movie App
//
//  Created by Fran Nasich on 26/02/2022.
//

import Foundation

struct MovieDetail: Codable {
    let id: Int
    let backdropPath: String?
    let title: String
    let originalLanguage: String
    let popularity: Double
    let releaseDate: String
    let overview: String
}
