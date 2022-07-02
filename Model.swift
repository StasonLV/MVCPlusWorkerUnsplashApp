//
//  Model.swift
//  MVCPlusWorkerUnsplashApp
//
//  Created by Stanislav Lezovsky on 26.06.2022.
//

import Foundation

struct SearchResults: Codable {
    let total: Int
    let results: [UnsplashPhoto]
}

struct RandomPhotos: Codable {
    let results: [UnsplashPhoto]
}

struct UnsplashPhoto: Codable {
    let width: Int
    let height: Int
    let created_at: String
    let user: [User.RawValue:String]
    let urls: [URLKing.RawValue:String]
    
    enum URLKing: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
    
    enum User: String {
        case instagram_username
    }
}

