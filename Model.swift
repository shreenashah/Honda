//
//  Model.swift
//  Honda Showroom
//
//  Created by Rami Taibah on 2/4/16.
//  Copyright © 2016 Studio 966. All rights reserved.
//

import Foundation
import UIKit

public enum CarColor {
    case White
    case Blue
    case Black
    case Red
}

class Model {
    
    var title: String
    var description: String
    var image: UIImage
    var color: CarColor
    
    init(titled: String, description: String, imageName: String){
        self.title = titled
        self.description = description
        if let img = UIImage(named:imageName){
            image = img
        } else {
            image = UIImage(named:"default")!
        }
        color = .White
    }
    
    
}
