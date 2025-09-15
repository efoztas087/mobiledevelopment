//
//  ContentView.swift
//  mobiledev
//
//  Created by Efe Oztas on 15/09/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.blue.opacity(0.3)
                .ignoresSafeArea()

            Image(systemName: "cloud.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .foregroundColor(.white)
                .opacity(0.8)
                .position(x: UIScreen.main.bounds.width - 100, y: UIScreen.main.bounds.height - 250)

            HStack {
                Image("profielfoto")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                    .shadow(radius: 4)

                Text("efe oztas")
                    .font(.title2)
                    .bold()
            }
            .padding()

            VStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("About Me")
                            .font(.title)
                            .bold()
                        Text("Hoi ik ben efe (18) en ik ben een student")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 16).fill(Color.blue.opacity(0.1)))
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.blue, lineWidth: 2))
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
