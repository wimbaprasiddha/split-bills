//
//  SideBarMenu.swift
//  split-bills
//
//  Created by wimba prasiddha on 25/07/20.
//  Copyright © 2020 wimba prasiddha. All rights reserved.
//

import SwiftUI

struct SideBarMenu: View {
    var body: some View {
        Menu()
    }
}

struct Menu: View {
    var body: some View {
        
        VStack{
            VStack(){
                Text("blah blah blah")
                .foregroundColor(.black)
                                   
                Text("blah blah blah")
                .foregroundColor(.black)
            }
            .padding(.horizontal, 30)
            .frame(width: UIScreen.main.bounds.width - 100, height: UIScreen.main.bounds.height - 100, alignment: .leading)
            .background(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .cornerRadius(30)
            .shadow(color: Color.init(#colorLiteral(red: 0.8, green: 0.8392156863, blue: 0.9254901961, alpha: 1)), radius: 8, x: 0, y: 6)
        }
        .position(x: 150, y:UIScreen.main.bounds.width)
        
            
    }
}

struct SideBarMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideBarMenu()
    }
}
