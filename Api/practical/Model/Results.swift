//
//  Result.swift
//  practical
//
//  Created by Nirav  on 16/11/20.
//

import Foundation

struct Results: Codable {
    let id, type: String
    let url: String
    let createdAt, company: String
    let companyURL: String
    let location, title, welcomeDescription, howToApply: String
    let companyLogo: String

    enum CodingKeys: String, CodingKey {
        case id, type, url
        case createdAt = "created_at"
        case company
        case companyURL = "company_url"
        case location, title
        case welcomeDescription = "description"
        case howToApply = "how_to_apply"
        case companyLogo = "company_logo"
    }
}

