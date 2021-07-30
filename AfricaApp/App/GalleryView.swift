//
//  GalleryView.swift
//  AfricaApp
//
//  Created by marco rodriguez on 26/07/21.
//

import SwiftUI

struct GalleryView: View {
    
    // MARK: - Properties
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    // Simple Grid Definition
    //let gridLayout: [GridItem] = [
    //    GridItem(.flexible()),
    //    GridItem(.flexible()),
    //    GridItem(.flexible())
    //]
    
    // Efficient Grid Definition
   // let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    //Dynamic Grid Layout
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColum: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColum))
    }
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                //MARK: - Image
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                
                //MARK: - Slider
                
                Slider(value: $gridColum, in: 2...6, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColum, perform: { value in
                        gridSwitch()
                    })
                
                //MARK: - Grid
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }//: Loop
                }//: LazyVGrid
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            }//: VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }//: Scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

// MARK: - Preview
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
