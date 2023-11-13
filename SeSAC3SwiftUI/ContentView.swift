//
//  ContentView.swift
//  SeSAC3SwiftUI
//
//  Created by JongHoon on 11/13/23.
//

import SwiftUI

// view modifier

struct ContentView: View {
    var body: some View {
        VStack {
            Text("ㅎㅇㅎㅇ")
                .font(.largeTitle)
                .bold()
                .background(.red)
                .padding()
                .foregroundStyle(.blue)
                .padding()
                .background(.black)
                .border(.green, width: 10.0)
                .clipShape(.buttonBorder)
            
            Text("ㅎㅇㅎㅇ")
                .font(.largeTitle)
                .bold()
                .background(.red)
                .padding()
                .foregroundStyle(.blue)
                .padding()
                .background(.black)
                .border(.green, width: 10.0)
                .clipShape(.buttonBorder)
            
            Button("클릭하기", action: {
                let value = type(of: self.body)
                print(value)
            })
            .foregroundStyle(.red)
            .background(.green)
        }
    }
}

#Preview {
    ContentView()
}


// Generic: 사용할 떄 타입을 구체적으로 지정
// some: Opaque type(swift 5.1)
