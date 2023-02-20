//
//  ContentView.swift
//  SwipeToConfirm
//
//  Created by Martin Bjeld on 16/05/2020.
//  Copyright © 2020 Martin Bjeld. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showUnlock = false
    @State private var didUnlock = false
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            // Position the SwipeToUnlockView in a place that is
            // nice to use with the thumb
            VStack {
                Spacer()
                if showUnlock {
                    SwipeToUnlockView()
                        .onSwipeSuccess {
                            self.didUnlock = true
                            self.showUnlock = false
                    }
                        .transition(AnyTransition.scale.animation(Animation.spring(response: 0.3, dampingFraction: 0.5)))
                    
                    
                }
            }
            .padding(.bottom, 120)
            
            if didUnlock {
                ConfirmationView()
                .transition(AnyTransition.scale.animation(Animation.spring(response: 0.5, dampingFraction: 0.5)))
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                            self.didUnlock = false
                            self.showUnlock = true
                        }
                }
            }
            
            
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear() {
            self.showUnlock = true
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
