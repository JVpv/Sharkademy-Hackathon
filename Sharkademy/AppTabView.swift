//
//  ContentView.swift
//  Sharkademy
//
//  Created by Matthew Lucas on 9/20/24.
//

import SwiftUI

struct AppTabView: View {
    
    var body: some View {
        TabView {
            LocationMapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
        }
        
    }
}

#Preview {
    AppTabView()
}


