
import Foundation


struct Services : Identifiable{
    let id: UUID = UUID()
    var KindsOfPet: [PetTypes]
    var servicesImage: String
    var name: String
    var description: String
    var typeOfServices: ServicesType = .Shower
}


enum ServicesType: String , CaseIterable{
    case Shower = "Shower"
    case Grooming = "Grooming"
    case Vaccsination = "Vaccsination"
    case Surgeries = "Surgeries"
}
