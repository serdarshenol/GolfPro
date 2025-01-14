//
//  HomeView.swift
//  GolfPro
//
//  Created by Serdar Senol on 14/01/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to Home View!")
                .font(.largeTitle)
            Button("Click Me") {
                print("Button tapped")
            }
        }
        .padding()
    }
}
