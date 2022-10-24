//
//  PackagesView.swift
//  HUGPet
//
//  Created by Ahad Obaid Albaqami on 13/12/1443 AH.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
//import Nuke
//import NukeUI
//import Combine
//import NetworkImage


struct ServicesView: View{
    
    @State var pressedPet : PetTypes = .Dog
    @State var pressedService : servicesType = .shower
    
   // @StateObject var packageViewModel = PackagesViewModel()
    @StateObject var servicesViewModel = ServicesViewModel()
    
   // @EnvironmentObject var sharedData: SharedDataViewModel
    @State var showingDetalisPackage: Bool = false
    
   // @StateObject var PetModel = PetViewModel()
   // @EnvironmentObject var authManager : AuthManager
    //    @StateObject var authName = AuthManager()
 //   @ObservedObject var userManager = AuthManager()
    @State var filterSearch = ""
    @ObservedObject var searchServices = ServicesViewModel()
    
//      @ObservedObject var firebasemanger: FirebaseManager = .shared
//    @State var selectedPet : PetInfo
//    @State var selectedPets : [PetInfo] = []
//
    
    var body: some View{
        
        ScrollView{
            
            VStack(spacing: 8){
//                HStack{
//
//                    Text("Hello \(firebasemanger.user.name)👋🏻, How can we help you?")
//                        .font(.system(size: 24, weight: .medium, design: .default))
//                   Spacer()
//
//                }
                    
                HStack{
                    Text("How can we help you?")
                        .font(.system(size: 20, weight: .medium, design: .default))
                    Spacer()
                }
                
                HStack{
                    ForEach(PetTypes.allCases){ petType in
                        
                        Button(action: {
                            
                            pressedPet = petType
                            
                        }) {
                            VStack{
                                Spacer()
                                
                                Image(petType.rawValue)
                                    .renderingMode(.template)
                                    .frame(maxWidth: 83 , maxHeight: 83)
                               
                                Text(petType.id)
                                    .font(.system(size: 12, weight: .semibold, design: .default))
                                
                            }
                            .foregroundColor(pressedPet == petType ? Color.red : Color.black)
                            
                            .background(pressedPet == petType ? Color(#colorLiteral(red: 0.2439258993, green: 0.2997204065, blue: 0.8384817243, alpha: 1)) : Color.blue)
                            .cornerRadius(8)
                        }
                    }
                }
                HStack{
                    
                    Text("Our Services")
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .foregroundColor(Color.pink)
                    
                    Spacer()
                }
                ForEach(servicesViewModel.servicesDetalis){ service in
                    
                    NavigationLink(destination: {
                        ScrollView{
                            
//                            ForEach(packageViewModel.packagesDetails.filter{$0.KindsOfPet.contains(where: { $0 == pressedPet})}){
//                                package in
//
//
//                                if service.name == "Shower" && package.typeOfPackage == "Shower" && pressedPet == .Cat && package.typeOfPet == "Cat" {
//
//                                    PackageCardView(package: package , pressedPet: pressedPet)
//                                        .environmentObject(PackagesViewModel())
//
//                                } else if service.name == "Grooming" && package.typeOfPackage == "Grooming"  && pressedPet == .Cat && package.typeOfPet == "Cat" {
//
//                                    VStack{
//                                        PackageCardView(package: package , pressedPet: pressedPet)
//                                            .environmentObject(PackagesViewModel())
//                                        Spacer()
//                                    }
//
//                                } else if service.name == "Surgeries" && package.typeOfPackage == "Surgeries" && pressedPet == .Cat && package.typeOfPet == "Cat"{
//
//                                    VStack{
//                                        PackageCardView(package: package , pressedPet: pressedPet)
//                                            .environmentObject(PackagesViewModel())
//                                        Spacer()
//                                    }
//
//                                } else if service.name == "Vaccination" && package.typeOfPackage == "Vaccination" && pressedPet == .Cat && package.typeOfPet == "Cat"{
//
//
//                                    PackageCardView(package: package , pressedPet: pressedPet)
//                                        .environmentObject(PackagesViewModel())
//
//
//
//                                } else if service.name == "Surgeries" && package.typeOfPackage == "Surgeries" && pressedPet == .Dog && package.typeOfPet == "Dog" {
//                                    VStack{
//                                        PackageCardView(package: package , pressedPet: pressedPet)
//                                            .environmentObject(PackagesViewModel())
//                                        Spacer()
//                                    }
//
//                                } else if service.name == "Shower" && package.typeOfPackage == "Shower" && pressedPet == .Dog && package.typeOfPet == "Dog" {
//
//                                    PackageCardView(package: package , pressedPet: pressedPet)
//                                        .environmentObject(PackagesViewModel())
//
//
//                                } else if service.name == "Vaccination" && package.typeOfPackage == "Vaccination" && pressedPet == .Dog && package.typeOfPet == "Dog"{
//
//                                    VStack{
//
//                                        PackageCardView(package: package , pressedPet: pressedPet)
//                                            .environmentObject(PackagesViewModel())
//
//                                    }
//
//                                }  else if service.name == "Grooming" && package.typeOfPackage == "Grooming" && pressedPet == .Dog && package.typeOfPet == "Dog"{
//
//                                    VStack{
//                                        PackageCardView(package: package , pressedPet: pressedPet)
//                                            .environmentObject(PackagesViewModel())
//                                        Spacer()
//                                    }
//                                }
//                                else if  pressedPet == .Rabbit || pressedPet == .Bird {
//                                    ComingSoonLottie(lottieFile: "coming_soon")
//                                }
//                            }
                        }
                    }, label: {
                        
//                        ServicesViewCard(services: service)
                        Text(service.name)
                    })
                    
                }
                
            }.padding(.horizontal)
            
        }.onAppear{
//            self.authManager.fetchCurrentUser()
            servicesViewModel.retreiveServices{service in
                self.servicesViewModel.servicesDetalis = service
                
            }        }
        
//        .navigationBarTitle("Hello \(firebasemanger.user.name)👋🏻")
        
        
        .toolbar {
            NavigationLink(destination: {
//                ProfileView(petInfo: $PetModel.NewPets)
//                    .environmentObject(FirebaseManager())
            }, label: {
                Image(systemName: "person.crop.circle")
                
                    .resizable()
                    .frame(width: 30, height: 30)
                    .imageScale(.large)
            })
        }
    }
    
    
    @ViewBuilder
    func PackageCardView(package: Packages , pressedPet: PetTypes)-> some View{
       // ScrollView{
        VStack(spacing: 4){
           
            ZStack{
                Image("BacgroundPackages")
                    .resizable()
                    .frame(maxWidth: .infinity )
                    .frame(height: 173)
                HStack(spacing: 6){
                    
                    
//                    NetworkImage(url: URL(string: package.image)) { image in
//                        image.resizable()
//                            .clipShape(RoundedRectangle(cornerRadius: 8))
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 130, height: 153.69)
//
//                    } placeholder: {
//                        ProgressView()
//                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
//                            .scaleEffect(1.5)
//
//                    } fallback: {
//                        Image(systemName: "photo")
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 140, height: 154)
//
//                    }
                    VStack(alignment: .leading ){
                        
                        if package.name == "Deep Shower" {
                            
                            HStack(){
                                Text(package.name)
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .foregroundColor(.white)
                                
                                Spacer()
                                // .frame(width: 3)
//                                StarViewLottie(lottieFile: "star")
//                                    .frame(width: 30, height: 30)
                                
                            }
                        } else {
                            HStack{
                                
                                Text(package.name)
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .foregroundColor(.white)
                                
                                Spacer()
                            }
                        }

                        Text(package.description.replacingOccurrences(of: "[br]", with: "\n"))

                                .font(.system(size: 10, design: .default))
                                .foregroundColor(.white)

                        NavigationLink {
//                            PackagesCardDetalisView(sharedData: _sharedData, package: package, petInfo: PetInfo(PetName: "", GenderPets: .male, BirthDayPets: Date(), heightPet: 2, WeightPet: 2, TypePets: "", ownerId: ""), orderinfo: Order(clinicId: "", driverId: "", customerName: "", orderstats: .onTheWayToClinic, selectedDate: Date(), ownerId: userManager.user?.id ?? ""), selectedDate: Date(), selectedPets: PetInfo(PetName: "", GenderPets: .female, BirthDayPets: Date(), heightPet: 8, WeightPet: 5, TypePets: "", ownerId: ""), PresedPet: pressedPet)
//                                .environmentObject(sharedData)

//                            PackagesCardDetalisView(package: package, petInfo: PetInfo(PetName: "", GenderPets: .male, BirthDayPets: Date(), heightPet: 2, WeightPet: 2, TypePets: "", ownerId: ""), PresedPet: pressedPet, orderinfo: Order(clinicId: "", driverId: "", customerName: "", orderstats: .onTheWayToClinic, selectedDate: Date(), ownerId: userManager.user?.id ?? ""), selectedDate: Date())
//                                .environmentObject(sharedData)

                        } label: {
                            HStack{
                                Spacer()
                                withAnimation(.easeInOut){
                                    Text("View")
                                        .bold()
                                        .foregroundColor(.black)
                                        .frame(width: 62, height: 26)
                                        .background(Color.white)
                                        .cornerRadius(8)
                                }
                            }
                        }
                        
                    }
                    
                }.padding(.horizontal , 16)
            }
           
        }.padding(.horizontal , 16)
            .navigationBarTitle("\(package.typeOfPackage) Packages")
            .navigationBarTitleDisplayMode(.large)
    }

    @ViewBuilder
    func ServicesViewCard(services: Services)-> some View{
        
        ScrollView{
            
            ZStack{


                VStack{
                    
                    HStack{
                        
                        Text(services.name)
                            .font(.system(size: 32, weight: .bold, design: .default))
                        
                        Spacer()
                    } .padding(.horizontal , 5)
                    
                    HStack{
                        
                        Text(services.description)
                            .font(.system(size: 12, weight: .semibold, design: .default))
                        Spacer()
                        //  .frame(width: 10)
                    }.padding(.horizontal , 5)
                    
                }.padding(.horizontal , 10)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.leading)
            }
        }
    }
    
}
