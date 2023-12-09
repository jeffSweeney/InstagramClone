//
//  MainTabView.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/8/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem { Image(systemName: "house") }
            
            SearchView()
                .tabItem { Image(systemName: "magnifyingglass") }
            
            Text("Upload Posts")
                .tabItem { Image(systemName: "plus.square") }
            
            Text("Notifications")
                .tabItem { Image(systemName: "heart") }
            
            CurrentUserProfileView()
                .tabItem { Image(systemName: "person") }
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
