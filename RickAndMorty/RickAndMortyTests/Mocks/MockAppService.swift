//
//  MockAppService.swift
//  RickAndMortyTests
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import Foundation
@testable import RickAndMorty

class MockAppService: AppServiceType {
    var didCallGetCharacters = false
    var mockCharacters: [Character]?
    var mockInfo: PageInfo = .stub()
    
    func getCharacters(for page: Int, status: CharacterStatus?, onSuccess: @escaping (PaginatedResponse) -> Void, onFailure: @escaping (Error) -> Void) {
        didCallGetCharacters = true
        
        if let characters = mockCharacters {
            let response = PaginatedResponse(info: mockInfo, characters: characters)
            onSuccess(response)
        } else {
            onFailure(NSError(domain: "", code: -1, userInfo: nil))
        }
    }
}
