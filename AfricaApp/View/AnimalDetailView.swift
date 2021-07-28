//
//  AnimalDetailView.swift
//  AfricaApp
//
//  Created by marco rodriguez on 26/07/21.
//

import SwiftUI

struct AnimalDetailView: View {
    //MARK: - Properties
    
    let animal: Animal
    
    
    //MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                //Hero Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                //Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor.frame(height: 6)
                            .offset(y: 25)
                    )
                
                //Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                //Gallery
                Group {
                    HeadingView(headingImage: "photo", headingText: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                    
                }
                .padding(.horizontal)
                
                //Facts
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                //Description
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All About \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                    
                }//: Group
                .padding(.horizontal)
                
                
                //MAP
                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    
                    InsetMapView()
                }
                .padding(.horizontal)
                
                
                //Link
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More...")
                    
                    ExternalWebLinkView(animal: animal)
                }
                .padding(.horizontal)
                Group {
                    HeadingView(headingImage: "desktopcomputer", headingText: "Developed By:")
                    HStack {
                        Image(systemName: "person")
                        Text("Ing. Marco Alonso")
                        Spacer()
                        Group{
                            Image(systemName: "arrow.up.right.square")
                            
                            Link("Website", destination: (URL(string: "https://github.com/marcoalonso") ?? URL(string: "https://apple.com"))!)
                        }
                        .foregroundColor(.accentColor)
                        
                    }//: HStack
                }
                .padding(.horizontal, 10)
                
            }//: Vstack
            .navigationBarTitle("Learn About \(animal.name)", displayMode: .inline)
        }//: ScrollView
        
    }
}

//MARK: - Preview
struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
        .previewDevice("iPhone 11 Pro")
    }
}
