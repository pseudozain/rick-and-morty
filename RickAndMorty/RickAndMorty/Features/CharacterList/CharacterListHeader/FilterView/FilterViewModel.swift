//
//  FilterViewModel.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 08/09/2024.
//

import Foundation

protocol FilterViewModelType: ObservableObject {
    var isAliveEnabled: Bool { get }
    var isDeadEnabled: Bool { get }
    var isUnknownEnabled: Bool { get }
    var statusChangeCallback: ((CharacterStatus?) -> Void)? { get set }
    
    func selectedFilter(with status: CharacterStatus)
}

final class FilterViewModel: FilterViewModelType {
    // MARK: - Properties
    private var status: CharacterStatus?
    
    @Published var isAliveEnabled: Bool = false
    @Published var isDeadEnabled: Bool = false
    @Published var isUnknownEnabled: Bool = false
    
    var statusChangeCallback: ((CharacterStatus?) -> Void)?
    
    // MARK: - Functions
    func selectedFilter(with status: CharacterStatus) {
        if self.status == status {
            self.status = nil
        } else {
            self.status = status
        }
        
        isAliveEnabled = self.status == .alive
        isDeadEnabled = self.status == .dead
        isUnknownEnabled = self.status == .unknown
        
        statusChangeCallback?(self.status)
    }
}
