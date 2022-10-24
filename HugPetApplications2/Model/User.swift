//
//  User.swift
//  HugPetApplications2
//
//  Created by Ahad Obaid Albaqami on 28/03/1444 AH.
//

import Foundation


struct User: Identifiable {
    
    var id: String = UUID().uuidString
    var name: String
    var phoneNumber: String
    var userOrders: [String]
//    var orders : Packages
    //    var item: Packages

}



class CurrentUser{
    
    private static var currentUser: CurrentUser = {
        let currentUser = CurrentUser()
        return currentUser
    }()
    
    private init() {}
    
    class func shared() -> CurrentUser {
        return currentUser
    }
    
    var user: User = User(name: "", phoneNumber: "", userOrders: [""])
    var name: String = ""
    var phoneNumber: String = ""
    var userOrders: [String] = [""]
    var userId: String = ""
//    var orders: Packages = Constant.packagesStruct
    
    func setUserData(user: User){
        CurrentUser.shared().user = user
        CurrentUser.shared().name = user.name
        CurrentUser.shared().phoneNumber = user.phoneNumber
        CurrentUser.shared().userOrders = user.userOrders
        CurrentUser.shared().userId = user.id
//        CurrentUser.shared().orders = user.orders
    }
    
    static let defaults = UserDefaults()
    static var defaultsUserID: String? {
        get {
            return defaults.string(forKey: "userID")
        }
        set {
            defaults.set(newValue, forKey: "userID")
        }
    }
}
