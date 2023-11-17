//
//  PosterView.swift
//  SeSAC3SwiftUI
//
//  Created by JongHoon on 11/15/23.
//

import SwiftUI

/*
 ScrollView
 LazyVStack vs VStack
 */
struct PosterView: View {
    
    @State private var isPresented = false
    
    var body: some View {
        ScrollView(showsIndicators: true) {
            LazyVStack {
                ForEach(0..<50) { item in
                    AsyncImageView()
                        .frame(width: 100.0, height: 100.0)
                        .onTapGesture {
                            print("\(item)")
                            isPresented.toggle()
                        }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .background(.green)
        .sheet(isPresented: $isPresented, content: {
            CategoryView()
        })
//        .contentMargins(
//            50.0,
//            for: .scrollIndicators
//        )
    }
}

struct AsyncImageView: View {
    let url = URL(string: "https://picsum.photos/100")
    var body: some View {
//        AsyncImage(url: url)
//        AsyncImage(
//            url: url,
//            content: { image in
//                image
//                    .frame(width: 140.0, height: 100.0)
//                    .scaledToFit()
//                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
//                    .background(.yellow)
//            },
//            placeholder: {
//                //                Image(systemName: "star")
//                ProgressView()
//            }
//        )
        
        AsyncImage(url: url) { data in
            switch data {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .scaledToFit()
//                    .frame(width: 100.0, height: 100.0)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
            case .failure(_):
//                print(error.localizedDescription)
                Image(systemName: "start")
            @unknown default:
                Image(systemName: "start")
            }
        }
        .background(.red)
    }
}

#Preview {
    PosterView()
//    AsyncImageView()
}
