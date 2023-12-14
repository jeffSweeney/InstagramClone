//
//  ContentViewModel.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/11/23.
//

import Combine
import Firebase

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
        
        service.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
    }
}
