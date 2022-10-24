//
//  ServicesViewModel.swift
//  HUGPet
//
//  Created by Ahad Obaid Albaqami on 04/12/1443 AH.
//

import Foundation
import FirebaseFirestore
import Firebase
import SwiftUI

class ServicesViewModel: ObservableObject{
    @Published var servicesDetalis : [Services] = []
    @Published var serviceType : ServicesType = .Shower

    @Published var filterServices: [Services] = []
    @Published var search = ""
    
    var tempServies: [Services] = []
//
//    init(){
//        let db = Firestore.firestore()
//
//        db.collection("Services").getDocuments { [self] (snap , error) in
//
//            guard let servicesTypes = snap else {return}
//
//            self.servicesDetalis = servicesTypes.documents.compactMap({(doc) -> Services? in
//                _ = doc.documentID
//
//                let name = doc.get("name") as! String
//                let description = doc.get("description") as! String
//                let servicesImage = doc.get("servicesImage") as! String
//                //let typeOfServices = doc.get("type") as! String
//
//                var service: Services {
//                    switch name {
//                    case "Shower":
//                        return Services(KindsOfPet: [.Dog , .Cat], servicesImage: servicesImage, name: name , description: description)
//
//                    case "Grooming":
//                        return Services(KindsOfPet: [.Dog , .Cat], servicesImage: servicesImage, name: name , description: description)
//
//                    case "Vaccination":
//                        return Services(KindsOfPet: [.Dog , .Cat ], servicesImage: servicesImage, name: name, description: description)
//
//                    case "Surgeries":
//                        return Services(KindsOfPet: [.Cat , .Dog], servicesImage: servicesImage, name: name, description: description)
//
//                    default:
//                        return Services(KindsOfPet: [.Rabbit], servicesImage: "", name: "", description: "")
//                    }
//                }
//                return service
//            })
//        }
//    }
    func retreiveServices(comletion: @escaping((_ services: [Services] ) -> Void)) {
        Firestore.firestore().collection("Services")
            .getDocuments { (querySnapshot, error) in
                if error != nil {
                    return
                }
                guard let querySnapshot = querySnapshot else {
                    return
                }
                var services: [Services] = []
                for document in querySnapshot.documents {
                    let data = document.data()
                    let service = Services(with: data)
                    services.append(service)
                }
                self.tempServies = services
                comletion(services)
            }
        
    }
//    func retreiveCategories(completion: @escaping ((_ categories: [Category]) -> Void)) {
//        Firestore.firestore().collection("foodcategories")
//            .getDocuments { (querySnapshot, error) in
//                if error != nil {
//                    return
//                }
//                guard let querySnapshot = querySnapshot else {
//                    return
//                }
//                var categories: [Category] = []
//                for document in querySnapshot.documents {
//                    let data = document.data()
//                    let category = Category(with: data)
//                    categories.append(category)
//                }
//                self.tempCategories = categories
//                completion(categories)
//            }
//    }
    func filteringData(){
        withAnimation(.linear){
            self.filterServices = self.servicesDetalis.filter{
                return $0.name.lowercased().contains(self.search.lowercased())
        }
        }
    }
}

