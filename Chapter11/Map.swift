//Modified version of map.swift
//  ContentView.swift
//  Chapter11
//
//  Created by Mike Panitz on 4/18/23.
//

import SwiftUI

struct MapExerciseView: View {
    @State private var scale: CGFloat = 1.0
    @GestureState private var magnification: CGFloat = 1.0
    @GestureState private var rotation: Angle = .degrees(0)
        @State private var accumulatedRotation: Angle = .degrees(0)

    
    var body: some View {
        VStack {
            Text("Map exercise goes here")
                .font(.largeTitle)
            
            Image("map") // "mapImage" 
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(height: 300) // Adjust the height as needed
            
                          .scaleEffect(scale) // Apply scale based on gesture
                          .scaleEffect(scale * magnification) // Apply scale based on gesture
                          .rotationEffect(rotation + accumulatedRotation)
                                         
                         
                          
                      Text("Explore the Map")
        }
        .padding()
        
        .gesture(
                    MagnificationGesture()
                        .onChanged { magnification in
                            scale = magnification
                        }
                        .onEnded { _ in
                            // Optional: Add any necessary cleanup after gesture ends
                        }
                )
                .edgesIgnoringSafeArea(.all) // Ignore safe area for full-screen display
        
                .gesture(
                            RotationGesture()
                                .updating($rotation) { currentState, gestureState, transaction in
                                    gestureState = currentState
                                }
                                .onEnded { finalRotation in
                                    accumulatedRotation += finalRotation
                                   
                                }
                        )
    }
}

struct MapExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        MapExerciseView()
    }
}
