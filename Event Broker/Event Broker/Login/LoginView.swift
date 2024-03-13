//
//  LoginView.swift
//  Event Broker
//
//  Created by Jose Luna on 3/6/24.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject private var broker: LoginEventBroker
    
    init(broker: LoginEventBroker) {
        self.broker = broker
    }
    
    var body: some View {
        switch broker.currentState {
            case .initial: initialView()
            case .success: MainView()
            case .failed: Text("Login Failed")
        }
    }
    
    private func initialView() -> some View {
        VStack {
            ForEach(LoginEvent.allCases, id: \.self) { item in
                Button {
                    broker.onEvent(item)
                } label: {
                    Text("Login with \(item.identifier)")
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(.blue))
                .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    LoginView(broker: .init())
}
