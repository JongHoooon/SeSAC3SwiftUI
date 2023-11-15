//
//  MovieView.swift
//  SeSAC3SwiftUI
//
//  Created by JongHoon on 11/14/23.
//

import SwiftUI

struct MovieView: View {
    @State private var isPresented = false
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            Image(.dummy)
                .resizable()
                .ignoresSafeArea()
            
            VStack() {
                Spacer()
                Button("SHOW") {
                    isPresented = true
                }
                .padding()
                .background(.white)
                Spacer()
                Image(.dummy)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .border(.white, width: 8.0)
                Spacer()
                HStack {
                    Circle()
                        .frame(width: 100, height: 100, alignment: .center)
                    Circle()
                        .frame(width: 100, height: 100, alignment: .center)
                    Circle()
                        .frame(width: 100, height: 100, alignment: .center)
                }
            }
            .padding(.horizontal, 100.0)
            
//            Image(systemName: "pencil")
//                .ignoresSafeArea()
//            Text("hi hi")
//                .font(.title)
        }
        .sheet(isPresented: $isPresented, content: {
            TamagochiView()
        })

    }
}

#Preview {
    MovieView()
}
