//
//  ContentView.swift
//  Event Broker
//
//  Created by Jose Luna on 3/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            LoginView(broker: .init())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
