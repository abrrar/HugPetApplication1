//
//  PhoneAuthView.swift
//  HUGPet
//
//  Created by Ahad Obaid Albaqami on 04/12/1443 AH.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import UIKit

struct PhoneAuthView: View {
    @State var isShowingHomeView: Bool = false
    @State var isShowingVerfiyView: Bool = false
    
    @State var fName: String = ""
    
    @State var phoneNumber: String = ""
    @State var smsCode: String = ""
    @EnvironmentObject var authManager : AuthManager
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var showLoading : Bool = false
    
    @AppStorage("Onboarding") var Onboarding: Bool = true
    
    @Environment (\.openURL) var openURL
    @State var isLoading : Bool = false
    @State private var progress : Double = 0
    //    init(){
    //        _ = UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemIndigo]
    ////        navColor.largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
    //
    ////        navColor.largeTitleTextAttributes = [.foregroundColor : UIColor.accentColor]
    //
    //
    //    }
    
    var body: some View {
        
        NavigationView{
            
            VStack(spacing: 32){
                //         loginAnimation()
                //                VStack{
                //
                //
                //                Image("HUGLogo")
                //                    .renderingMode(.template)
                //                    .frame(width: 170, height: 235, alignment: .center)
                //                    .foregroundColor(.accentColor)
                //
                //                    Spacer()
                //                    .frame(height: 30)
                //                }
                Text("Wolcome To HUGPet App")
                    .font(.system(size: 24, weight: .bold, design: .default))
                VStack(alignment: .leading){
                    
                    HStack{
                        Text("Enter Your Name")
                            .font(.system(size: 12, weight: .bold, design: .default))
                        Spacer()
                        // .frame(width: 230)
                    }.padding(.horizontal , 5)
                    
                    HStack{
                        TextField("Sara" , text: $fName)
                            .submitLabel(.next)
                          //  .padding()
                        
                    } .padding(.horizontal , 5)
                    .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.gray)
//                        .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.1098036841, green: 0.1098041013, blue: 0.1183908954, alpha: 1)) : Color.backgroundGray)
                        .cornerRadius(16)
//                        .padding(.horizontal , 8)
                }
                // Divider()
                VStack(alignment: .leading){
                    
                    HStack{
                        Text("Enter Your Phone Number")
                            .font(.system(size: 12, weight: .bold, design: .default))
                        Spacer()
                        // .frame(width: 200)
                    }.padding(.horizontal , 5)
                    HStack{
                        Text("🇸🇦 +966")
                        TextField("54.....", text: $phoneNumber)
                            .submitLabel(.next)
                            .keyboardType(.phonePad)
                        
                        
                    } .padding(.horizontal , 5)
                    .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.gray)
//                        .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.1098036841, green: 0.1098041013, blue: 0.1183908954, alpha: 1)) : Color.backgroundGray)
                        .cornerRadius(16)
                       // .padding(.horizontal , 8)
                    
                }
                
                //.padding()
                VStack{
                    
                    Button {
                        openURL(URL(string: "https://aseel3liq.wixsite.com/my-site/terms-and-conditions")!)
                    } label: {
                        Text("By joining, \(Text("you agree to our Terms of Service and Privacy Policy").foregroundColor(.blue))")
                            .foregroundColor(colorScheme == .dark ? .white : .black )
                            .font(.system(size: 10, weight: .regular, design: .default))
                    }
                }
                Button(action: {
                    showLoading.toggle()
                    DispatchQueue.main.async {
                        
                        authManager.createUserWithPhoneNumber(phoneNumber: phoneNumber, fName: fName) { isSuccess in
                            print("DEBUG: phone \(isSuccess)")
                            
                            showLoading.toggle()
                            isShowingVerfiyView = true
                            //                          isShowingVerfiyView.toggle()
                        }
                    }
                    
                }, label: {
                    
                    Text("Send Verification")
                        .font(.system(size: 17, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(16)
                    
                })  .disabled(phoneNumber.isEmpty)
                
          
                //                .disabled(phoneNumber.isEmpty || fName.isEmpty)
                //                Divider()
                //
                //                TextField("Enter OTP Code", text: $smsCode)
                //                //.padding()
                //                    .padding()
                //
                //
                //                Button {
                //                    DispatchQueue.main.async {
                //                        authManager.verifySMSCode(verificationCode: smsCode, phoneNumber: phoneNumber) { isSuccess in
                //                            print("DEBUG: in code \(isSuccess)")
                //                            isShowingHomeView.toggle()
                //                        }
                //                    }
                //                } label: {
                //                    Text("Login")
                //                        .frame(width: 324, height: 56)
                //                        .background(Color.accentColor)
                //                        .foregroundColor(.white)
                //                        .cornerRadius(8)
                //                }
                //
                //                Button(action: {
                //                    authManager.createUserWithPhoneNumber(phoneNumber: phoneNumber) { isSuccess in
                //                        print("DEBUG: phone \(isSuccess)")
                //                    }
                //                }, label: {
                //                    Text("Resend Code")
                //                        .font(.system(size: 14, weight: .regular, design: .default))
                //                        .foregroundColor(.textColor)
                //                        .underline()
                //                        .multilineTextAlignment(.center)
                //                })
                
                //                Spacer()
                //                    .frame(height: 180)
            }.padding(.horizontal , 10)
               // .navigationTitle("Login")
//            overlay(
//                //      ProgressViewExample()
//                //      CircularProgressViewStyle()
//                ZStack{
//                    Color.black.ignoresSafeArea()
//                    .opacity(0.5)
//                    //self.startLoading()
//                    VStack(spacing: 5){
//                        ProgressView("Loading...", value: progress, total: 100)
//                            .progressViewStyle(CircularProgressViewStyle(tint: .indigo))
//                        //            .foregroundColor(.green)
//
//                            .scaleEffect(1.5)
//                        //  .tint(.white)
//                        //          Text(“Checking for phone “)
//                        //            .foregroundColor(.white)
//                        //            .padding()
//                    }
//                }.opacity(isLoading ? 0.5 : 0)
//                //.progressViewStyle(progress)
//                //        .opacity(Color.indigo)
//                //        .blur(radius: , opaque: true)
//            )
        }
//        .onAppear{
//            showLoading = true
//
//
//
//            showLoading = false
//
//        }
        .overlay(
            ZStack{
                Color.black.ignoresSafeArea()
                    .opacity(0.5)
            ProgressView("OTP Will Sent")
               // .font(.subheadline)
                .progressViewStyle(CircularProgressViewStyle(tint: .indigo))
                //.scaleEffect(1.5)
            } .opacity(showLoading ? 0.5 : 0)
        )
        .fullScreenCover(isPresented: $isShowingVerfiyView , onDismiss: dismissLogin) {
            VerfiyCode(phoneNumber: $phoneNumber, smsCode: $smsCode, fName: $fName)
       
        }
        .fullScreenCover(isPresented: $isShowingHomeView) {
           TabBarViews()
       }
     
    }
    func dismissLogin(){
       isShowingHomeView = true
    }
}

struct PhoneAuthView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneAuthView()
            .environmentObject(AuthManager())
    }
}

//struct CustomeLoadingView: View{
//    var body: some View{
//        ZStack{
//            Color.black.ignoresSafeArea()
//                .opacity(0.5)
//        ProgressView("OTP Will Sent")
//            .progressViewStyle(CircularProgressViewStyle(tint: .indigo))
//        }
//    }
//}

struct VerfiyCode: View{
    
    @Binding var phoneNumber: String
    @Binding var smsCode: String
    @Binding var fName: String
    @State var showLoading : Bool = false
    @EnvironmentObject var authManager : AuthManager
  //  @Binding var isShowingHomeView : Bool
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        NavigationView{
            VStack(spacing: 32){
                
                Text("Code Verification\("\n") \(Text("The code has been sent to 0\(phoneNumber)")                         .font(.system(size: 14, weight: .regular, design: .default)))")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .multilineTextAlignment(.center)
                HStack{
                TextField("Enter OTP Code", text: $smsCode)
                    .keyboardType(.phonePad)
                }.padding(.horizontal ,8)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color.gray)
//                    .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.1098036841, green: 0.1098041013, blue: 0.1183908954, alpha: 1)) : Color.backgroundGray)
                    .cornerRadius(16)
                   // .padding(.horizontal , 5)
                
                Button(action: {
                    showLoading.toggle()
                    DispatchQueue.main.async {
                        authManager.verifySMSCode(verificationCode: smsCode, phoneNumber: phoneNumber, name: fName) { isSuccess in
                            print("DEBUG: in code \(isSuccess)")
                            //                            isShowingHomeView.toggle()
                           // isShowingHomeView.toggle()
                            showLoading.toggle()
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }, label: {
                    Text("Login")
                        .font(.system(size: 17, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(16)
                    
                })
                .disabled(smsCode.isEmpty)
                
//                Button(action: {
//
//                    DispatchQueue.main.async {
//
//                    authManager.createUserWithPhoneNumber(phoneNumber: phoneNumber, fName: fName) { isSuccess in
//                        print("DEBUG: phone \(isSuccess)")
//                    }
//                    }
//                }, label: {
//                    Text("Resend Code")
//                        .font(.system(size: 14, weight: .regular, design: .default))
//                        .foregroundColor(.textColor)
//                        .underline()
//                        .multilineTextAlignment(.center)
//                })
                
            }.padding()
            
                .navigationTitle("Verification Code")
                .navigationBarTitleDisplayMode(.inline)
        }.overlay(
            ZStack{
                Color.black.ignoresSafeArea()
                    .opacity(0.5)
            ProgressView("Validation Checking")
                .progressViewStyle(CircularProgressViewStyle(tint: .indigo))
              //  .scaleEffect(1.5)
            } .opacity(showLoading ? 0.5 : 0)
        )
        
        
    }
}


//struct loginAnimation : View{
//
//    @State var currentIndex: Int = 1
//
//    @Environment(\.colorScheme) var colorScheme
//
//    var body: some View{
//        VStack{
////
////            Image("HUGLogo")
////                .renderingMode(.template)
////                .frame(width: 170, height: 235, alignment: .center)
//////                .foregroundColor(colorScheme == .dark ? .white : .accentColor)
////                .foregroundColor(.accentColor)
////
//
//            TabView(selection: $currentIndex){
//
//                    ForEach(1...3,id: \.self){ index in
//                        GeometryReader{ proxy -> AnyView in
//
//                            return AnyView(
//
//                                VStack{
//                                Image("LoginPic\(index)")
//                                    .resizable()
//                                    .frame(maxHeight: .infinity , alignment: .center)
//                                    .aspectRatio(contentMode: .fit)
//
//                                Text("HUG Pet")
//                                    .font(.largeTitle)
//                                    .fontWeight(.heavy)
//
//                                Text("Be Prepared")
//                                    .font(.system(size: 17, weight: .bold, design: .default))
//
//                            }
//                                    .frame(maxHeight: .infinity , alignment: .center)
//                            )
//
//
//
//                        }   .tag(index)
//                            .foregroundColor(.accentColor)
//                            .padding(.top , 30)
//                }
//            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//
//            CustomTabIndicators(count: 3, current: $currentIndex)
//                .padding(.vertical)
//                .padding(.top)
//        }
////        .frame(maxWidth: .infinity, maxHeight: .infinity)
////        .background(Color.accentColor).ignoresSafeArea()
//    }
//}


//struct CustomTabIndicators: View{
//
//    var count: Int
//    @Binding var current: Int
//    var body: some View{
//        HStack{
//            ForEach(0..<count, id: \.self){ index in
//
//                ZStack{
//                    if (current - 1 ) == index {
//                        Circle()
//                            .fill(Color.accentColor)
//
//                    }else{
//                        Circle()
//                            .fill(Color.textColor)
//
//                    }
//                }
//                .frame(width: 10, height: 10)
//            }
//        }
//    }
//}
