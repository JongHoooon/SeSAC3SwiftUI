//
//  MenuView.swift
//  SeSAC3SwiftUI
//
//  Created by JongHoon on 11/13/23.
//

import SwiftUI

struct MenuView: View {
    
    var cardProperty: some View {
        VStack(spacing: 10.0) {
            Image(systemName: "star")
                .background(.red)
            Text("text")
                .background(.green)
        }
        .padding(10.0)
        .background(.yellow)
    }
    
    func cardProperty(image: String, text: String) -> some View {
        VStack(spacing: 10.0) {
            Image(systemName: image)
                .background(.red)
            Text(text)
                .background(.green)
        }
        .padding(10.0)
        .background(.yellow)
    }
    
    var body: some View {
        Spacer(minLength: 24.0)
        
        VStack {
            HStack(spacing: 16.0) {
                cardProperty
                CardView(image: "star", text: "토스뱅크")
                CardView(image: "person", text: "고객센터")
                CardView(image: "pencil", text: "토스증권")
                cardProperty
                CardView(image: "star", text: "tetet")

            }
            
            List {
                Section("보안") {
                    Text("보안과 인증")
                        .modifier(PointBoarderText())
                    Text("내 신용 점수")
                    Text("진행 중인 이벤트")
                        .asPointBorderText()
                }
                
                Section("자산") {
                    Text("보안과 인증")
                    Text("내 신용 점수")
                    Text("진행 중인 이벤트")
                }
            }
            .listStyle(.grouped)
        }
    }
}

struct CardView: View {
    let image: String
    let text: String
    
    var body: some View {
        VStack(spacing: 10.0) {
            Image(systemName: image)
                .background(.red)
            Text(text)
                .background(.green)
                .underline()
        }
        .padding(10.0)
        .background(.yellow)
    }
}

struct PointBoarderText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .padding(10.0)
            .foregroundStyle(.white)
            .background(.purple)
            .clipShape(Capsule())
    }
}

extension View {
    func asPointBorderText() -> some View {
        modifier(PointBoarderText())
    }
}

#Preview {
    MenuView()
}
