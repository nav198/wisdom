//
//  Model.swift
//  wisdomLeaf_Task
//
//  Created by admin on 24/06/24.
//

import Foundation

struct PhotosListElement: Codable {
    let id, author: String
    let width, height: Int
    let url, downloadURL: String

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}
