//
//  RenderView.swift
//  SeSAC3SwiftUI
//
//  Created by JongHoon on 11/13/23.
//

import SwiftUI

struct RenderView: View {
    @State
    var age = 10
    
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
                    .frame(width: .infinity, height: 100)
                    
                    NavigationLink("push") {
                        MenuView()
                    }
                    
                    
                    Text("Hue: \(age) \(Int.random(in: 1...100))")
                    KokoView()
                    bran
                    Text("KoKo: \(age) \(Int.random(in: 1...100))")
                    Button("클릭") {
                        age = Int.random(in: 1...100)
                        print("age: \(age)")
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
