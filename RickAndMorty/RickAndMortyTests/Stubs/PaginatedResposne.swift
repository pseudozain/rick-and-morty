//
//  PaginatedResposne.swift
//  RickAndMortyTests
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import Foundation
@testable import RickAndMorty

extension PaginatedResponse {
    static func stub(
        info: PageInfo = .stub(),
        characters: [Character] = [.stub()]
    ) -> PaginatedResponse {
        PaginatedResponse(info: info, characters: characters)
    }
}

extension PageInfo {
    static func stub(
        next: URL? = URL(string: "www.example.com")
    ) -> PageInfo {
        PageInfo(next: next)
    }
}


extension PaginatedResponse: Equatable {
    public static func == (lhs: RickAndMorty.PaginatedResponse, rhs: RickAndMorty.PaginatedResponse) -> Bool {
        return lhs.info.next?.absoluteString == rhs.info.next?.absoluteString
        && lhs.characters == rhs.characters
    }
}
