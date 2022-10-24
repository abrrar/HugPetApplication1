//
//  Packages.swift
//  ClinicApp
//
//  Created by ABRAR on 15/02/1444 AH.
//

import SwiftUI
import FirebaseFirestore

struct Packages: Identifiable {
    
    var id = UUID()
//    var id: String?
    let orderID: String  // done
    //  var id : String = UUID().uuidString
    let KindsOfPet: [PetTypes] = [.Cat] // done
    //name of packag
    let name : String // done
    let description: String // done
    let price : Double // done
    let image: String // done
    //services
    let typeOfPackage: String // done
    let typeOfServices: servicesType = .shower
    let quantity: Int = Int(0.2)
    let status: String
    
    // var ImagesPet = [ Image(“ShowerCat1”) ,Image(“ShowerCat2") , Image(“ShowerCat1”) ]
    let typeOfPet: String
    let isAdded: Bool = false
    let ownerId: String // done
 
    init(with firebaseDict: [String:Any] ){
        
        self.orderID = firebaseDict["orderID"] as? String ?? ""
        self.name = firebaseDict["name"] as? String ?? ""
        self.price = firebaseDict["price"] as? Double ?? 0.1
        self.ownerId = firebaseDict["ownerId"] as? String ?? ""
        self.typeOfPackage = firebaseDict["typeOfPackage"] as? String ?? ""
        self.image = firebaseDict["image"] as? String ?? ""
        self.description = firebaseDict["description"] as? String ?? ""
        //self.quantity = firebaseDict["quantity"] as? Int ??
        self.typeOfPet = firebaseDict["typeOfPet"] as? String ?? ""
        self.status = firebaseDict["status"] as? String ?? ""
    
        
      

    }
    

    //let packages = Packages(with: <#T##[String : Any]#>)
    
}

enum servicesType : Codable {
    case shower
    case grooming
    case vacc
    case castr
}







