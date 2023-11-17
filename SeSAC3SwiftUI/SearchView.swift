//
//  SearchView.swift
//  SeSAC3SwiftUI
//
//  Created by JongHoon on 11/16/23.
//

import SwiftUI

//struct SearchView: View {
//    
//    @State var randomNumber = 0
//    
//    init(randomNumber: Int = 0) {
//        self.randomNumber = randomNumber
//        print("search view init!")
//    }
//    
//    var body: some View {
//        VStack(spacing: 8.0) {
//            HueView()
//            jackView
//            kokoView()
//            Text("Bran \(randomNumber)")
//                .background(Color.random())
//            Button("클릭", action: {
//                randomNumber = Int.random(in: 1...100)
//            })
//        }
//    }
//    
//    var jackView: some View {
//        Text("Jack")
//            .background(Color.random())
//    }
//    
//    func kokoView() -> some View {
//        return Text("Koko")
//            .background(Color.random())
//    }
//} 

struct Movie: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let color = Color.random()
}

struct SearchView: View {
    
    @State private var searchQuery = ""
    
    let movies = [
        Movie(name: "어벤져스"), Movie(name: "어벤져스2"),
        Movie(name: "엑스맨"), Movie(name: "어벤져스3"),
        Movie(name: "해리포터2"), Movie(name: "A"),
        Movie(name: "해리포터3"), Movie(name: "AB"),
    ]
    
    var filterMovie: [Movie] {
        return searchQuery.isEmpty
            ? movies
            : movies.filter { $0.name.contains(searchQuery) }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filterMovie, id: \.id) { item in
//                    NavigationLink(
//                        destination: {
//                            NavigationLazyView(SearchDetailView(movie: item))
//                        },
//                        label: {
//                            HStack(spacing: 16.0) {
//                                Circle().foregroundStyle(item.color)
//                                Text(item.name)
//
//                            }
//                        }
//                    )

                    NavigationLink(
                        value: item,
                        label: {
                            HStack(spacing: 16.0) {
                                Circle().foregroundStyle(item.color)
                                Text(item.name)
                            }
                        }
                    )
                }
                .frame(height: 60.0)
            }
            .navigationTitle("검색")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination( // ios 16
                for: Movie.self,
                destination: {
                    SearchDetailView(movie: $0)
                }
            )
        }
        .searchable(
            text: $searchQuery,
            placement: .navigationBarDrawer,
            prompt: "검색!"
        )
        .onSubmit(of: .search) {
            print("\(searchQuery)")
        }
    }
}

struct SearchDetailView: View {
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        print("Search Detail View Init")
    }
    
//    var body: some View {
//        Text("\(movieName) SEARCH DETAIL VIEW")
//    }
    var body: some View {
        
        VStack {
            Text(movie.name)
            Button("기본 버튼") {
                print("dfdfdf")
            }
            Button(
                action: {
                    print("fdfdfd")
                },
                label: {
                    HStack {
                        Circle().foregroundStyle(.red)
                        Text("Button")
                    }
                }
            )
            .frame(width: 100.0, height: 40.0)
        }
    }
}

#Preview {
    SearchView()
}

struct HueView: View {
    init() {
        print("Hue View Init!")
        // 네트워크 통신 주의!!
        // state 변경될 때 마다 호출됨
    }
    
    // 연산, 저장 프로퍼티 비교
    // body는 연산 프로퍼티
    var body: some View {
        Text("Hue")
            .background(Color.random())
    }
}

extension Color {
    static func random() -> Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
