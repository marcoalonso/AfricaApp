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
        
        
        //MARK: -Body
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
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
