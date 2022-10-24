//
//  AuthManager.swift
//  HugPetApplications2
//
//  Created by Ahad Obaid Albaqami on 28/03/1444 AH.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import Firebase

  final class AuthManager: ObservableObject {
    
//      @Published var userName = User(id: "", name: "", phoneNumber: "", userOrders: [""], orders: Constant.packagesStruct)
      
    @Published var verificationId: String?
    @Published var isAouthenticatting = false
      
    @Published var user : User?
    @Published var isLoading : Bool = false
    @Published var signInProcessing = false

    @Published var fName: String?
    @Published var isUserCurrentlyLoggedOut = false
    static let shared = AuthManager()
      
    private let auth = Auth.auth()
    private var db = Firestore.firestore()

    init(){
        fetchCurrentUser()
        }
    
    func createUserWithPhoneNumber(phoneNumber: String, fName: String, completion: @escaping ( (Bool) -> Void )) {
        
        print("DEBUG: 1 - preparing to request SMS Code")
        self.showLoadingView()
        
        

        PhoneAuthProvider.provider().verifyPhoneNumber("+966" + phoneNumber, uiDelegate: nil) { [weak self] verificationId, error in
            print("DEBUG: 2 - Sending Request")
            
            if let error = error {
                print("DEBUG: error while getting verificationId \(error)")
            }
            self?.hideLoadingView()
          //  self?.isAouthenticatting.toggle()
            guard let verificationId = verificationId else {
                completion(false)
                return
            }
            print("DEBUG: 3 - Successfully requested SMS Code")
            self?.verificationId = verificationId
            completion(true)
        }
    }
    
    func verifySMSCode(verificationCode: String, phoneNumber: String , name : String , completion: @escaping ( (Bool) -> Void )) {
        print("DEBUG: 4 - Verifying SMS Code")
        guard let verificationId = verificationId else {
            completion(false)
            return
        }
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId,
                                                                 verificationCode: verificationCode)
        print("DEBUG: 5 - Create Credential")
        self.showLoadingView()
        
        auth.signIn(with: credential) { authResult, error in
            if let error = error {
                print("DEBUG: error while verifying smsCode \(error)")
            }
            print("DEBUG: 6 - Successfully Uploaded user info to firebase with saved phone number")
            guard let authResult = authResult else {return}
            let userId = authResult.user.uid
//            let fname = authResult.user.displayName
            let userData = [
                "id": userId,
                "phoneNumber": phoneNumber,
                "name" : name
            ]
            
            Firestore.firestore().collection("users").document(userId).setData(userData as [String : Any])
            completion(true)
        }
    }
    
    func handleSignout (){
        try? Auth.auth().signOut()
       // self.isAouthenticatting.toggle()
//        self.user = nil
    }
    
    
    func fetchCurrentUser() {
      guard let userId = auth.currentUser?.uid else {return}
        
        db.collection("users").document(userId).getDocument { snapshot, error in
        guard let snapshot = snapshot else {return}
        guard let dataDic = snapshot.data() else {return}
        self.user?.id = dataDic["id"] as? String ?? ""
            self.user?.name = dataDic["name"] as? String ?? ""
            self.user?.phoneNumber = dataDic["phoneNumber"] as? String ?? ""
//        self.user.imageURLString = dataDic["imageURLString"] as? String ?? “”
      }
    }
      
      
      
//  }
    
//    func fetchUserData() {
//
//
//        db.collection("users").addSnapshotListener { (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else {
//                print("No documents")
//                return
//            }
//
//            self.user = documents.map { (queryDocumentSnapshot) -> User in
//
//                guard let dataDic = snapshot.data() else {return}
//
//                self.user.id = dataDic["id"] as? String ?? ""
//                self.user.name = dataDic["name"] as? String ?? ""
//                self.user.phoneNumber = dataDic["phoneNumber"] as? String ?? ""
////                let surname = data["surname"] as? String ?? ""
//                return User(name: name, surname: surname)
//            }
//        }
//    }
//    func fetchUserData(){
//        guard let userId = auth.currentUser?.uid else {return}
//
//        let docRef = Firestore.firestore().collection("users").document(userId)
//        docRef.getDocument(source: .cache) { (document, error) in
//          if let document = document {
//            let name = document.get("name")
//            print("Cached document data: \(name)")
//          } else {
//            print("Document does not exist in cache")
//          }
//        }
//    }
    
    
    
//    func fitchPets(){
//
//        guard let _ = Auth.auth().currentUser?.uid else {return}
//
//        Firestore.firestore().collection("users").addSnapshotListener{ snapshot, erorr in
//            guard let users = snapshot?.documents.compactMap({try? $0.data (as: User.self)}) else{  return}
//            self.user = users
//        }
//    }
    
    
//    func handleSignout(){
//
////        try? Auth.auth().signOut()
////        self.isAouthenticatting = false
////        self.user = nil
//
//        isUserCurrentlyLoggedOut.toggle()
//        try? Auth.auth().signOut()
//
////        try? FirebaseManager.shared.auth.signOut()
//
//    }
//    func handleLogOut(){
//        guard let _ = Auth.auth().currentUser?.uid else {return}
//
//        do{
//           try Auth.auth().signOut();
//
//        } catch let logoutError {
//           print(logoutError)
//         }
//    }
    
    private func showLoadingView(){isLoading = true}
    private func hideLoadingView(){isLoading = false}
}
