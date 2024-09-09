//
//  CharacterListViewModelTests.swift
//  RickAndMortyTests
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import XCTest
import Networking
@testable import RickAndMorty

class CharacterListViewModelTests: XCTestCase {
    // MARK: - Properties
    var sut: CharacterListViewModel!
    var mockService: MockAppService!
    var mockActionCallback: CharacterListActionCallback!
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()
        mockService = MockAppService()
        mockActionCallback = { _ in }
        sut = CharacterListViewModel(service: mockService, actionCallback: mockActionCallback)
    }
    
    // MARK: - Tear down
    override func tearDown() {
        sut = nil
        mockService = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    func testNumberOfSections_shouldBeOne() {
        XCTAssertEqual(sut.numberOfSections, 1)
    }

    func testNumberOfRows_whenDataIsNotYetLoaded_shouldBeZero() {
        XCTAssertEqual(sut.numberOfRows(in: 0), 0)
    }

    func testNumberOfRows_whenDataIsLoaded_shouldNumberOfCharactersPlusOne() {
        // given
        let characters = [Character.stub()]
        mockService.mockCharacters = characters
        let reloadExp = XCTestExpectation(description: "Reload callback should be triggered")
        sut.reloadCallback = { reloadExp.fulfill() }

        // when
        sut.onViewLoaded()

        // then
        wait(for: [reloadExp], timeout: 1.0)
        XCTAssertTrue(mockService.didCallGetCharacters)
        XCTAssertEqual(sut.numberOfRows(in: 0), characters.count + 1)
    }
    
    func testNumberOfRows_whenDataIsNotLoaded_shouldNumberZero() {
        // given
        mockService.mockCharacters = nil
        let reloadExp = XCTestExpectation(description: "Reload callback should be triggered")
        sut.reloadCallback = { reloadExp.fulfill() }

        // when
        sut.onViewLoaded()

        // then
        wait(for: [reloadExp], timeout: 1.0)
        XCTAssertTrue(mockService.didCallGetCharacters)
        XCTAssertEqual(sut.numberOfRows(in: 0), .zero)
    }

    
    func testSelectedRow_shouldInvokeActionCallback() {
        // given
        let character = Character.stub()
        mockService.mockCharacters = [character]
        let actionExp = XCTestExpectation(description: "Action callback should be triggered")
        let reloadExp = XCTestExpectation(description: "Reload callback should be triggered")
        var selectedCharacter: Character?
        sut = CharacterListViewModel(service: mockService, actionCallback: { action in
            switch action {
            case .openDetails(let char):
                selectedCharacter = char
                actionExp.fulfill()
            }
        })
        sut.reloadCallback = { reloadExp.fulfill() }
        sut.onViewLoaded()
        wait(for: [reloadExp], timeout: 1.0)
        
        // when
        sut.selectedRow(at: IndexPath(row: 0, section: 0))
        
        // then
        wait(for: [actionExp], timeout: 1.0)
        XCTAssertEqual(selectedCharacter, character)
    }

    func testHeaderViewModel() {
        let headerViewModel = sut.headerViewModel(for: 0)
        XCTAssertTrue(headerViewModel is CharacterListHeaderViewModel)
    }

    func testWillDisplayCell_whenRowIsNotLast_thenShouldNotCallGetCharactersOnService() {
        // given
        let characters = [Character.stub()]
        mockService.mockCharacters = characters
        sut.onViewLoaded()
        mockService.didCallGetCharacters = false
        
        // when
        sut.willDisplayCell(for: IndexPath(row: 0, section: 0))
        
        // then
        XCTAssertFalse(mockService.didCallGetCharacters)
    }
    
    func testWillDisplayCell_whenRowIsLastAndMoreDataCanBeLoaded_thenShouldCallGetCharactersOnService() {
        // given
        let characters = [Character.stub()]
        mockService.mockCharacters = characters
        sut.onViewLoaded()
        mockService.didCallGetCharacters = false
        
        // when
        sut.willDisplayCell(for: IndexPath(row: 1, section: 0))
        
        // then
        XCTAssertTrue(mockService.didCallGetCharacters)
    }

    
    func testWillDisplayCell_whenRowIsLastAndMoreDataCanNotBeLoaded_thenShouldNotCallGetCharactersOnService() {
        // given
        mockService.mockCharacters = [.stub()]
        mockService.mockInfo = .stub(next: nil)
        sut.onViewLoaded()
        mockService.didCallGetCharacters = false
        
        // when
        sut.willDisplayCell(for: IndexPath(row: 0, section: 0))
        
        // then
        XCTAssertFalse(mockService.didCallGetCharacters)
    }
    
    func testFilterSelection_thenShouldLoadDataFromStart() {
        // given
        mockService.mockCharacters = [.stub(), .stub(), .stub()]
        let reloadExp = XCTestExpectation(description: "Reload callback should be triggered")
        sut.reloadCallback = { reloadExp.fulfill() }
        sut.onViewLoaded()
        wait(for: [reloadExp], timeout: 1.0)
        
        mockService.mockCharacters = [.stub()]
        let reloadExp2 = XCTestExpectation(description: "Reload callback should be triggered")
        sut.reloadCallback = { reloadExp2.fulfill() }
        
        // when
        (sut.headerViewModel(for: .zero) as! CharacterListHeaderViewModel).filterViewModel.selectedFilter(with: .alive)
        
        // then
        wait(for: [reloadExp2], timeout: 1.0)
        XCTAssertEqual(sut.numberOfRows(in: .zero), 2)
    }
}
