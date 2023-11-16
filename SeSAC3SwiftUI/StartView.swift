//
//  StartView.swift
//  SeSAC3SwiftUI
//
//  Created by JongHoon on 11/15/23.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Text("홈 화면")
                    Image(systemName: "house.fill")
                }
            PosterView()
                .tabItem {
                    Text("홈 화면")
                    Image(systemName: "house.fill")
                }
            CategoryView()
                .tabItem {
                    Text("홈 화면")
                    Image(systemName: "house.fill")
                }
        }
    }
}

#Preview {
    StartView()
}
