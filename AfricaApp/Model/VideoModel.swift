//
//  VideoModel.swift
//  AfricaApp
//
//  Created by marco rodriguez on 28/07/21.
//

import UIKit

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    //Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
