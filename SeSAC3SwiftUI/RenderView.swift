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
        VStack {
            Text("Hue: \(age) \(Int.random(in: 1...100))")
            KokoView()
            bran
            Text("KoKo: \(age) \(Int.random(in: 1...100))")
            Button("클릭") {
                age = Int.random(in: 1...100)
                print("age: \(age)")
            }
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
