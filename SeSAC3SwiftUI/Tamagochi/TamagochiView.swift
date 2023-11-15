//
//  TamagochiView.swift
//  SeSAC3SwiftUI
//
//  Created by JongHoon on 11/14/23.
//

import SwiftUI

//struct User {
////    @State var nickname = "고래밥"
//    
//    var introduce: String {
//        mutating get {
//            nickname = "칙촉"
//            return "안녕하세요 \(nickname)입니다."
//        }
//    }
//    
//    func changeNickname() {
////        nickname = "칙촉"
//    }
//}

// 앱에서 UI는 Data에 의존해서 자신의 상태를 결정하게 된다.
//

struct TamagochiView: View {
    // source of truth - state
    // View에 대한 상태를 저장하기 위한 목적 -> private로 설정
    // 상태 프로퍼티
    // @State private var nickname = "고래밥"
    // @Binding Derived Value - 파생된 데이터
    @State private var countOfWater = 0
    @State private var countOfRice = 0
    @State private var isOn = false
    @State private var text = "안녕하세요"
    
    var body: some View {
        
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack(spacing: 16.0) {
                TextField("텍스트 필드", text: $text)
                
                Toggle("스위치", isOn: $isOn)
                    .padding(.horizontal, 20.0)
                    .padding(.bottom, 20.0)
                
                VStack(spacing: 8.0) {
                    FeedCountView(title: "물방울", count: $countOfWater)
                    
                    Button("물방울 갯수", action: {
                        countOfWater += 1
                        isOn.toggle()
                    })
                    .padding(50.0)
                    .background(.green)
                }
                
                VStack(spacing: 8.0) {
                    FeedCountView(title: "밥알", count: $countOfRice)
                    
                    Button(
                        action: {
                            countOfRice += 1
                        },
                        label: {
                            Text("밥알 갯수")
                                .padding(50.0)
                                .background(.yellow)
                        })
                }
            }
        }
    }
}

#Preview {
    TamagochiView()
}

struct FeedCountView: View {
    let title: String
    // 상위 뷰의 state를 사용할 때 사용한다.
    // @Binding Derived Value - 파생된 데이터
    @Binding var count: Int
    
    var body: some View {
        HStack {
            Text("\(title)울 갯수: \(count)개")
                .background(.black)
                .foregroundStyle(.white)
                .font(.title)
            
            Button("하위뷰 버튼") {
                // 여기서도 count += 1
                count += 1
            }
        }
    }
}
