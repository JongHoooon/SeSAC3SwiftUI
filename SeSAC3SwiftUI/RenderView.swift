//
//  RenderView.swift
//  SeSAC3SwiftUI
//
//  Created by JongHoon on 11/13/23.
//

import SwiftUI

struct RenderView: View {
    
    // 시스템에서 정의된 값을 감지하고 뷰를 업데이트 할 수 있음
//    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    @State var age = 10
    
    init(age: Int = 10) {
        self.age = age
        print("Render View Init")
    }
    
    var bran: some View {
        Text("Bran: \(Int.random(in: 1...100))")
    }
    
    var body: some View {
        NavigationView {
                VStack {
                    HStack {
                        RoundedRectangle(cornerRadius: 30.0)
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.red,
                                    Color.yellow,
                                    Color.blue
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            ))
                        RoundedRectangle(cornerRadius: 30.0)
                            .fill(RadialGradient(
                                gradient: Gradient(colors: [
                                    .red,
                                    .orange,
                                    .mint
                                ]),
                                center: .center,
                                startRadius: 20,
                                endRadius: 60
                            ))
                        RoundedRectangle(cornerRadius: 30.0)
                            .fill(
                                AngularGradient(
                                    colors: [.yellow, .green, .purple],
                                    center: .center,
                                    angle: .degrees(90.0)
                                ))
                    }
                    .frame(height: 100)
                    
                    NavigationLink("push") {
                        MenuView()
                    }
                    
                    
                    Text("Hue: \(age) \(Int.random(in: 1...100))")
                    KokoView()
                    Button(colorScheme == .dark ? "다크모드 클릭" : "라이트모드 클릭") {
                        dismiss.callAsFunction()
                    }
                    .background(colorScheme == .dark ? .white : .yellow)
                    .foregroundStyle(colorScheme == .dark ? .white : .yellow)
                    
                    bran
                    Text("KoKo: \(age) \(Int.random(in: 1...100))")
                    Button("클릭") {
//                        age = Int.random(in: 1...100)
//                        print("age: \(age)")
                        dismiss.callAsFunction()
                    }
                }
            .navigationTitle("Render View")
            .navigationBarItems(leading: Text("클릭"))
            
        }
    }
}



#Preview {
    RenderView()
}

struct KokoView: View {
    var body: some View {
        Text("Jack: \(Int.random(in: 1...100))")
    }
}
