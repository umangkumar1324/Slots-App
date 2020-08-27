//
//  ContentView.swift
//  Slots
//
//  Created by Umang Kumar on 8/26/20.
//  Copyright © 2020 Umang Kumar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private var symbols = ["apple","star","cherry"]
    @State private var nums = [0,0,0]
    @State private var credits = 1000
    private var betAmount = 5
    private var winAmount = 10

    
    //BackGround
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees:45))
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                //Title
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("SwiftUI Slots")
                        .bold()
                        .foregroundColor(.white)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2)
                Spacer()
                //Credit Counter
                
                Text("Credits: " + String(credits) )
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                Spacer()
                //Cards
                
                HStack{
                    Spacer()
                    
                    Image(symbols[nums[0]])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)

                    Image(symbols[nums[1]])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                    Image(symbols[nums[2]])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                    
                    Spacer()
                }
                Spacer()
                Button(action: {
                    //change the image
                    self.nums[0] = Int.random(in:
                        0...self.symbols.count-1)
                    self.nums[1] = Int.random(in:
                    0...self.symbols.count-1)
                    self.nums[2] = Int.random(in:
                    0...self.symbols.count-1)
                    
                    //check if all the picture are the same
                    
                    if self.nums[0] == self.nums[1] && self.nums[1] == self.nums[2]{
                        self.credits += self.winAmount
                    }
                    else{
                        self.credits -= self.betAmount
                    }
                }){
                    Text("SPIN")
                    .bold()
                    .padding(7)
                    .padding([.leading,.trailing], 30)
                    .foregroundColor(.white)
                    .background(Color.pink)
                    .cornerRadius(20)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
