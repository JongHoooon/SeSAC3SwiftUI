//
//  TransitionView.swift
//  SeSAC3SwiftUI
//
//  Created by JongHoon on 11/15/23.
//

import SwiftUI

/*
 버튼을 클릭해서 화면 Dismiss / Pop
 화면 전환 시 데이터 전달
 화면 전환 시 분기 처리
 */

struct TransitionView: View {
    @State private var isFull = false
    @State private var isSheet = false
    
    init(
        isFull: Bool = false,
        isSheet: Bool = false
    ) {
        self.isFull = isFull
        self.isSheet = isSheet
        print("Transition View Init")
    }
    
    var body: some View {
        NavigationView {
            HStack(spacing: 20.0) {
                Button("Full") {
                    isFull.toggle()
                }
                Button("Sheet") {
                    
                    isSheet = true
                }
                NavigationLink("Push") {
                    // transition view init시 같이 init됨
//                    RenderView()
                    NavigationLazyView(RenderView())
                }
                NavigationLink("Push") {
                    NavigationLazyView(RenderView())
                }
            }
            .sheet(
                isPresented: $isSheet,
                content: {
                RenderView()
            })
            .fullScreenCover(
                isPresented: $isFull,
                content: {
                RenderView()
            })
        }
    }
}

#Preview {
    TransitionView()
}
