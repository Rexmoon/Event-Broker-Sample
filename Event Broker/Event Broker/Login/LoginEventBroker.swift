//
//  LoginEventBroker.swift
//  Event Broker
//
//  Created by Jose Luna on 3/6/24.
//

import Foundation

enum LoginEvent: CaseIterable {
    case google
    case apple
    case facebook
    case email
    
    var identifier: String { String(describing: self).capitalized }
}

enum LoginState {
    case initial
    case success
    case failed
}

final class LoginEventBroker: ObservableObject {
    
    @Published var currentState: LoginState = .initial
    
    func onEvent(_ event: LoginEvent) {
        print("Inside event handler")
        switch event {
        case .google: onGoogleLoginIntent()
        case .apple: onAppleLoginIntent()
        case .facebook: onFacebookLoginIntent()
        case .email: onEmailLoginIntent()
        }
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            self.currentState = .initial
        }
    }
    
    /// On event could have crucial information
    private func onGoogleLoginIntent() {
        currentState = .failed
    }
    
    private func onFacebookLoginIntent() {
        currentState = .failed
    }
    
    private func onAppleLoginIntent() {
        currentState = .success
    }
    
    private func onEmailLoginIntent() {
        currentState = .success
    }
}
