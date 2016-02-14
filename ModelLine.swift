//
//  ModelLine.swift
//  Honda Showroom
//
//  Created by Rami Taibah on 2/4/16.
//  Copyright © 2016 Studio 966. All rights reserved.
//

import Foundation

class ModelLine {
    
    var name: String
    var models: [Model]
    
    
    init(named: String, includeModels: [Model]){
        name = named
        models = includeModels
    }
    
    class func modelLines() -> [ModelLine]{
        return[self.hondaCars()]
    }
    
    private class func hondaCars() -> ModelLine {
        var models = [Model]()
        models.append(Model(titled:"2016 Honda CR-V", description:"All day and into the night, CR-V delivers dynamic crossover performance and style. It's also incredibly spacious, with luxury amenities at the top of its class.", imageName: "crv.jpg"))
        models.append(Model(titled:"2016 Honda Pilot", description:"The all-new Honda Pilot brings a new standard of comfort and quality to SUV driving. Already famous for its on-road drivability, roomy interior and excellent fuel efficiency.", imageName: "pilot.jpg"))
        
        
        
        return ModelLine(named:"Honda Cars", includeModels: models)
    }
    
}
