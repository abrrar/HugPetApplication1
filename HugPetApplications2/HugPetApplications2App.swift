//
//  HugPetApplications2App.swift
//  HugPetApplications2
//
//  Created by ABRAR on 28/03/1444 AH.
//

import SwiftUI
import Firebase

@main
struct HugPetApplications2App: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
//            ContentView()
            ServicesView()
            
        }
    }
}
