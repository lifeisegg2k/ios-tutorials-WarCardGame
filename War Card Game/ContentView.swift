//
//  ContentView.swift
//  War Card Game
//
//  Created by yuchul Kim on 2024/06/07.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard:String = "back"
    @State var cpuCard:String = "back"
    
    @State var playerScore:Int = 0
    @State var cpuScore:Int = 0
    
    var body: some View {
        
        ZStack {
            
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                                
                Button {
                    deal()
                } label: {
                    Image("button")
                }
                
                Spacer()
                HStack {
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .padding(.bottom, 10.0)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
            }
        }
    }
    
    func deal() {
        func randomNum() -> Int {
            return Int.random(in: 2...14)
        }
        
        let playerNum = randomNum()
        let cpuNum =  randomNum()
        // Randomize the players card
        playerCard = "card" + String(playerNum)
        // Randomize the cpu card
        cpuCard = "card" + String(cpuNum)
        // Update the scores
        if playerNum > cpuNum {
            playerScore += 1
        } else if playerNum < cpuNum {
            cpuScore += 1
        }
    
    }
    
}

#Preview {
    ContentView()
}
