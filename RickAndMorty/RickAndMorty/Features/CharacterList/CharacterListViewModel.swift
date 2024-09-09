//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 08/09/2024.
//

import Foundation

protocol CharacterListViewModelType {
    var numberOfSections: Int { get }
    var reloadCallback: (() -> Void)? { get set }
    
    func numberOfRows(in section: Int) -> Int
    func cellViewModelForRow(at indexPath: IndexPath) -> ReusableCellViewModelType
    func headerViewModel(for section: Int) -> ReusableCellViewModelType
    func selectedRow(at indexPath: IndexPath)
    func onViewLoaded()
    func willDisplayCell(for indexPath: IndexPath)
}

enum CharacterListAction {
    case openDetails(Character)
}

typealias CharacterListActionCallback = (CharacterListAction) -> Void

final class CharacterListViewModel {
    // MARK: - Properties
    var numberOfSections: Int = 1
    var reloadCallback: (() -> Void)?
    
    private var headerViewModel = CharacterListHeaderViewModel()
    private let service: AppServiceType
    private let actionCallback: CharacterListActionCallback?
    private var currentPage = 1
    private var shouldFetchMore = true
    private var characters = [Character]()
    private let loaderViewModel = LoaderCellViewModel()
    private var cellViewModels: [ReusableCellViewModelType] = []
    private var filter: CharacterStatus? = nil
    
    // MARK: - Initializer
    init(service: AppServiceType, actionCallback: CharacterListActionCallback?) {
        self.service = service
        self.actionCallback = actionCallback
        
        setupHeaderCallback()
    }
    
    // MARK: - Functions
    func setupHeaderCallback() {
        headerViewModel.filterViewModel.statusChangeCallback = { [weak self] status in
            self?.filter = status
            self?.loadFromStart()
        }
    }
}

extension CharacterListViewModel: CharacterListViewModelType {
    func onViewLoaded() {
        loadFromStart()
    }
    
    func numberOfRows(in section: Int) -> Int {
        cellViewModels.count
    }
    
    func cellViewModelForRow(at indexPath: IndexPath) -> any ReusableCellViewModelType {
        cellViewModels[indexPath.row]
    }
    
    func headerViewModel(for section: Int) -> any ReusableCellViewModelType {
        headerViewModel
    }
    
    func selectedRow(at indexPath: IndexPath) {
        actionCallback?(.openDetails(characters[indexPath.row]))
    }
    
    func willDisplayCell(for indexPath: IndexPath) {
        guard indexPath.row == cellViewModels.count - 1 else { return }
        loadNextPage()
    }
}

// MARK: - API
private extension CharacterListViewModel {
    func loadFromStart() {
        characters.removeAll()
        cellViewModels.removeAll()
        cellViewModels.append(loaderViewModel)
        reloadCallback?()
        currentPage = 1
        shouldFetchMore = true
        loadNextPage()
    }
    
    func loadNextPage() {
        guard shouldFetchMore else { return }
        
        service.getCharacters(for: currentPage + 1, status: filter) { [weak self] response in
            self?.handleSuccess(response)
        } onFailure: { [weak self] error in
            self?.handleError()
        }
    }
    
    func handleSuccess(_ response: PaginatedResponse) {
        shouldFetchMore = response.info.next != nil
        currentPage += 1
        characters.append(contentsOf: response.characters)
        let loader = cellViewModels.removeLast()
        
        cellViewModels
            .append(contentsOf: response.characters.map { CharacterCellViewModel(character: $0) })
        
        if shouldFetchMore {
            cellViewModels.append(loader)
        }
        
        reloadCallback?()
    }
    
    func handleError() {
        shouldFetchMore = false
        cellViewModels.removeLast()
        reloadCallback?()
    }
}
