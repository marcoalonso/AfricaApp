//
//  ContentView.swift
//  AfricaApp
//
//  Created by marco rodriguez on 26/07/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //MARK: - Properties
        let animals: [Animal] = Bundle.main.decode("animals.json")
        
        //MARK: -Body
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                ForEach(animals) { animal in
                    AnimalListItemView(animal: animal)
                }
                
            }//: List
            .navigationBarTitle("AfricaApp", displayMode: .large)
        }//: Navigation
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
