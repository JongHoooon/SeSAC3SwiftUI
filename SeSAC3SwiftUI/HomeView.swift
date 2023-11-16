//
//  HomeView.swift
//  SeSAC3SwiftUI
//
//  Created by JongHoon on 11/15/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50.0) {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 16.0) {
                        ForEach(1..<10) { _ in
                            AsyncImageView()
                        }
                    }
                }
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 16.0) {
                        ForEach(1..<10) { _ in
                            AsyncImageView()
                        }
                    }
                }
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 16.0) {
                        ForEach(1..<10) { _ in
                            AsyncImageView()
                        }
                    }
                }
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 16.0) {
                        ForEach(1..<10) { _ in
                            AsyncImageView()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
