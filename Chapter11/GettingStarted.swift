//Modified version
//  ContentView.swift
//  Chapter11
//
//  Created by Mike Panitz on 4/18/23.
//

import SwiftUI

struct GettingStartedExerciseView: View {
    
    @State private var rectangleColor = Color.blue // Starting color
    @State private var rotationAngle: Angle = .degrees(0)
    @State private var degree = 0.0
    @State private var scale: CGFloat = 1.0
    @State private var offset = CGSize.zero
    var body: some View {
        VStack {
            Text("Getting started exercise goes here")
                .font(.largeTitle)
            
            ZStack {
                Rectangle()
                    .frame(width: 130, height: 100)
                    .foregroundColor(rectangleColor) // use the current color
                    .onTapGesture {
                        rectangleColor = Color.random() // Change to a random color
                    }
                
                    .gesture(
                        LongPressGesture(minimumDuration: 2)
                            .onEnded { _ in
                                rectangleColor = Color.blue // Reset to starting color
                            }
                    )
                
                    .rotationEffect(Angle(degrees: degree)) // Apply rotation to the rectangle
                    .scaleEffect(scale) // Apply scale to the rectangle
                    .offset(offset) // Apply offset to the rectangle


                Text("Tap and Hold")
                    .foregroundColor(.white)
                    .font(.headline)
                    .rotationEffect(rotationAngle) // Apply rotation to the text
                    .scaleEffect(scale) // Apply scale to the text
                    .offset(offset) // Apply offset to the text
                
                    .gesture(
                                      RotationGesture()
                                          .onChanged({ angle in
                                              degree = angle.degrees
                                          })
                                  )
                
                    .gesture(
                                   DragGesture()
                                       .onChanged { gesture in
                                           offset = gesture.translation
                                       }
                                       .onEnded { _ in
                                           offset = CGSize.zero
                                       }
                               )
                
                
                
                   
            }
            
            .gesture(
                           MagnificationGesture()
                               .onChanged { scaleValue in
                                   scale = scaleValue
                               }
                       )
            
         
        }
        
        
        .padding()
        
    }
}

extension Color {
    static func random() -> Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color(red: red, green: green, blue: blue)
    }
}

struct GettingStartedExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        GettingStartedExerciseView()
    }
}
