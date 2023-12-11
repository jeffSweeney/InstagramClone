//
//  ContentViewModel.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/11/23.
//

import Combine
import Firebase

class ContentViewModel: ObservableObject {
    private let service = AuthService.shared
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$userSession.sink { [weak self] user in
            self?.userSession = user
        }
        .store(in: &cancellables)
    }
}
