//
//  ContentView.swift
//  mobiledev
//
//  Created by Efe Oztas on 15/09/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var cookieCount = 0
    @State private var grandmaCount = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        TabView {
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
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Top 10 Projecten")
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom, 10)
                    
                    LazyVStack(spacing: 16) {
                        ForEach(1...10, id: \.self) { index in
                            HStack(spacing: 12) {
                                Image(systemName: "app.fill")
                                    .font(.title)
                                    .foregroundColor(.blue)
                                Text("Project \(index)")
                                    .font(.headline)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.blue.opacity(0.3), lineWidth: 1))
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                        }
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .tabItem {
                Image(systemName: "folder.fill")
                Text("Projects")
            }

            VStack(spacing: 24) {
                Spacer()
                // Cookie Button
                Button(action: { cookieCount += 1 }) {
                    Text("🍪")
                        .font(.system(size: 120))
                        .padding()
                        .background(Circle().fill(Color.orange.opacity(0.3)))
                        .overlay(Circle().stroke(Color.orange, lineWidth: 4))
                        .shadow(radius: 6)
                }

                
                Button(action: {
                    if cookieCount >= 10 {
                        cookieCount -= 10
                        grandmaCount += 1
                    }
                }) {
                    HStack {
                        Text("👵")
                        Text("Buy Grandma (10 🍪)")
                    }
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.pink.opacity(0.2)))
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.pink, lineWidth: 2))
                }
                .disabled(cookieCount < 10)
                .padding(.horizontal)

                
                Text("Cookies: \(cookieCount)")
                    .font(.title2.bold())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.orange.opacity(0.2)))
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.orange, lineWidth: 2))
                    .padding(.horizontal)

               
                Text("Grandmas: \(grandmaCount)")
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.pink.opacity(0.2)))
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.pink, lineWidth: 2))
                    .padding(.horizontal)

                
                Button("Reset") {
                    cookieCount = 0
                    grandmaCount = 0
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.red.opacity(0.8)))
                .foregroundColor(.white)
                .padding(.horizontal)
                Spacer()
            }
            .onReceive(timer) { _ in
                cookieCount += grandmaCount
            }
            .tabItem {
                Image(systemName: "circle.fill")
                Text("Cookie")
            }

            VStack {
                Text("Settings Page")
                    .font(.largeTitle)
                    .bold()
            }
            .tabItem {
                Image(systemName: "gearshape.fill")
                Text("Settings")
            }
        }
    }
}

#Preview {
    ContentView()
}
