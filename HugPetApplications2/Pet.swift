//
//  Pet.swift
//  HUGPet
//
//  Created by Ahad Obaid Albaqami on 04/12/1443 AH.
//

import Foundation

enum PetTypes:  String, Identifiable, CaseIterable , Codable {
    
    public var id: String {
        return self.rawValue.capitalized
    }
    
    case Dog
    case Cat
    case Rabbit
    case Bird
}
