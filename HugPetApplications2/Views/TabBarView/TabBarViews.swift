//
//  TabBarViews.swift
//  HugPetApplications2
//
//  Created by Ahad Obaid Albaqami on 28/03/1444 AH.
//

import SwiftUI

enum TabPressed{
    case services
    case order
    case orderList
}

struct TabBarViews: View {
    @State var tabSelected : TabPressed = .services

    var body: some View {
       
        TabView(selection: $tabSelected){
            
            NavigationView { ServicesView()
//                    .environmentObject(sharedData)
            }
            .tabItem{
                Image(systemName: "pawprint.fill")
                Text("Services")
            }
            .tag(TabPressed.services)
            
            
            NavigationView{
                OrderView()
//                OrderView(package: Constant.packagesStruct , orderinfo: Constant.orderStruct, selectedDate: Date())
//                    .environmentObject(sharedData)
//                    .environmentObject(sho)
                
            }
            .tabItem {
                Image(systemName: "bag.fill")
                Text("Order")
                
            }
            .tag(TabPressed.order)
            
//                NavigationView{
                OrderList()
                
//                }
                    .tabItem {
                        Image(systemName: "doc.badge.plus")
                        Text("Order List")
                        
                    }
                    .tag(TabPressed.orderList)
            
        }
    }
}

struct TabBarViews_Previews: PreviewProvider {
    static var previews: some View {
        TabBarViews()
    }
}
