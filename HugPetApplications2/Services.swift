
import Foundation


struct Services : Identifiable{
    let id: UUID = UUID()
    var KindsOfPet: [PetTypes] = [.Cat]
    var servicesImage: String
    var name: String
    var description: String
    var typeOfServices: ServicesType = .Shower
    
    
    init(with firebaseDict: [String:Any] ){
        
        self.servicesImage = firebaseDict["servicesImage"] as? String ?? ""
        self.name = firebaseDict["name"] as? String ?? ""
        self.description = firebaseDict["description"] as? String ?? ""

    }
}


enum ServicesType: String , CaseIterable{
    case Shower = "Shower"
    case Grooming = "Grooming"
    case Vaccsination = "Vaccsination"
    case Surgeries = "Surgeries"
}


