//
//  Country.swift
//  HW-4-1
//
//  Created by Iryna Mishyna on 08.10.2021.
//

import Foundation

class Country {
    
    let id: UUID
    let name: String
    let imageName: String
    let description: String
    var isExpanded: Bool
    
    init(name: String, imageName: String, description: String) {
        self.id = UUID()
        self.name = name
        self.imageName = imageName
        self.description = description
        self.isExpanded = false
        
    }
    
    static var sampleCountries = [Country(name: "Ukraine",
                                          imageName: "Ukraine",
                                          description: "In Ukraine we don't say: \"I just graduated, and now have a dream job\", we say: \"вільна каса!\", and I think that's beautiful."),
                                  Country(name: "Poland",
                                          imageName: "Poland",
                                          description: "Polish food is absolutely delicious! Gołąbki, golonka, żurek and kotlet schabowy will blow your mind but the Polish dish that you MUST try is called pierogi!"),
                                  Country(name: "Greece",
                                          imageName: "Greece",
                                          description: "People in Greece got together and decided what they wanted to do. It also was the country that gave birth to Western civilization. This means Greek history has had an enormous impact on our lives."),
                                  Country(name: "USA",
                                          imageName: "USA",
                                          description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                                  Country(name: "China",
                                          imageName: "China",
                                          description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."),
                                  Country(name: "Middle-earth",
                                          imageName: "Great Britain",
                                          description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
    ]
    
    static let sampleFavoritesCountries = [
                                Country(name: "Ukraine",
                                        imageName: "Ukraine",
                                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                                Country(name: "Poland",
                                        imageName: "Poland",
                                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                                Country(name: "Greece",
                                        imageName: "Greece",
                                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    ]
    
    static func generation() -> Country {
        return Country(name: "Ukraine",
                       imageName: "Ukraine",
                       description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    }
}

// Hashable Country as class

extension Country: Hashable {
    
    static func == (lhs: Country, rhs: Country) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}

