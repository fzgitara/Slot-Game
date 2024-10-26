//
//  ContentView.swift
//  Slot Game
//
//  Created by Fachrizal Gita Rahmanda on 26/10/24.
//

import SwiftUI

struct ContentView: View {
    let images = ["apple", "cherry", "star"]
    @State private var credit:Int = 1000
    @State private var image1:String = ""
    @State private var image2:String = ""
    @State private var image3:String = ""
    @State private var isWin:Bool = false

    func randomizeImages() {
        image1 = images.randomElement()!
        image2 = images.randomElement()!
        image3 = images.randomElement()!
    }
    
    func countCreditScore() {
        if (image1 == image2 && image1 == image3) {
            credit += 100
            isWin = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isWin = false
            }
        } else {
            credit -= 10
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("Slot Mania")
                        .font(.largeTitle)
                    Text("Mantap!!!")
                        .font(.title2)
                        .padding(.top, -30.0)
                }
                
                Spacer()
                
                Text("Credit: \(String(credit))")
                    .font(.headline)
                    .fontWeight(.regular)
                
                Spacer()
                
                HStack() {
                    Image(image1).resizable().scaledToFit()
                    Image(image2).resizable().scaledToFit()
                    Image(image3).resizable().scaledToFit()
                }
                
                Spacer()
                
                if (credit == 0) {
                    Button("Try Again") {
                        randomizeImages()
                        credit = 1000
                    }
                        .padding()
                        .frame(width: 128.0, height: 48.0)
                        .background(Color(red: 0.877, green: 0.139, blue: 0.286))
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                        .font(.headline)
                } else {
                    Button("Spin") {
                        randomizeImages()
                        countCreditScore()
                    }
                        .padding()
                        .frame(width: 128.0, height: 48.0)
                        .background(Color(red: 0.877, green: 0.139, blue: 0.286))
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                        .font(.headline)
                }
                
                Spacer()
                    .frame(height: 100.0)
            
            }
            .padding()
            .onAppear() {
                randomizeImages()
            }
            
            if (isWin) {
                Text("WIN!!!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.yellow)
                    .offset(x: 0, y: -200)
            }
            
            if (credit == 0) {
                Text("LOSE!!!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.yellow)
                    .offset(x: 0, y: -200)
            }
        }
    }
}

#Preview {
    ContentView()
}
