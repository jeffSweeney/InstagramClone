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
    
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
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
