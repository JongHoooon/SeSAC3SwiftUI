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
                    RenderView()
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
