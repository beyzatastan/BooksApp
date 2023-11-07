//
//  BooksModel.swift
//  Books
//
//  Created by İbrahim Ay on 5.08.2023.
//

import Foundation

struct BooksModel: Codable {
    let kind: String
    let totalItems: Int
    let items: [Items]
}

struct Items: Codable {
    let kind: String
    let id: String
    let etag: String
    let selfLink: String?
    let volumeInfo: VolumeInfo
}

struct VolumeInfo: Codable {
    let title: String?
    let subtitle:String?
    let description: String?
    let imageLinks: ImageLinks
    let language: String?
    let infoLink:String?
    let publisher: String?
    let previewLink: String?
    let publishedDate: String?

}

struct ImageLinks: Codable {
    let smallThumbnail: String?
    let thumbnail: String?
}

