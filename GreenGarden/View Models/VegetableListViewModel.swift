//
//  VegetableListViewModel.swift
//  GreenGarden
//
//  Created by Admin on 9/27/21.
//

import Foundation

@MainActor //makes everytthing within run on the mainthread
class VegetableListViewModel: ObservableObject {
    @Published var vegetables: [VegetableViewModel] = []
    
    func getAll() async {
        do {
            let vegetables = try await Webservice().getAllVegetables(url: Constants.Urls.getAllVegetables)
            self.vegetables = vegetables.map(VegetableViewModel.init)
            //map function returns new array... each vegetables from data is assigned respective init of each vegetableViewModel property
        } catch {
            print(error)
        }
    }
    
    
    
}

struct VegetableViewModel {
    fileprivate let vegetable: VegetableDTO
    //file private prevents access from view - only access from respective file location
    
    
    var id: Int {
        vegetable.vegetableId
    }
    
    var name: String {
        vegetable.name
    }
    
    var description: String {
        vegetable.description
    }
    
    var thumbnailUrl: URL? {
        URL(string: vegetable.thumbnailImage)
    }
    
    var seedDepth: String {
        vegetable.seedDepth
    }
    
    var growingSoilTemperature: String {
        vegetable.growingSoilTemp
    }
    var sowingDescription: String {
        vegetable.sowingDescription
    }
    
    var growingDescription: String {
        vegetable.growingDescription
    }
}

extension VegetableViewModel {
    static func `default`() -> VegetableViewModel {
        // `literal`  is used to escape swift keyword, default, to make it usable in the way we want with no conflict
        
        let vegetable = VegetableDTO(vegetableId: 1, name: "Apple", description: "description", thumbnailImage: "imageName", seedDepth: "0", growingSoilTemp: "0", sowingDescription: "sowing description", growingDescription: "growing description")
        
        return VegetableViewModel(vegetable: vegetable)
        
    }
}
