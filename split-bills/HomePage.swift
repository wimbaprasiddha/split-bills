//
//  HomePage.swift
//  split-bills
//
//  Created by wimba prasiddha on 24/07/20.
//  Copyright © 2020 wimba prasiddha. All rights reserved.
//

import SwiftUI

struct HomePage: View {
    
    let image =  "Home"
   
    var body: some View {
        
        ZStack{
            VStack{
                HStack{
                    
                    Button(action: { }){
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    .padding()
                    
                }
            }
        }
//        VStack{
//
//            HStack(alignment: .top){
//
//                    Button(action: {
//                //Type action here
//                    }) {
//                        ProfileButton()
//                        .foregroundColor(Color.init(#colorLiteral(red: 0.06666666667, green: 0.3019607843, blue: 0.5882352941, alpha: 1)))
//                        .frame(width: 100, height: 250, alignment: .leading)
//                    }
//
//                Spacer()
//                        Image(image)
//                            .resizable()
//                            .frame(width: 250, height: 250, alignment: .top)
//            }
//
//            Greetings(nilai:0)
//                Search()
//
//            Text("Poliklinik")
//                .foregroundColor(Color.init(#colorLiteral(red: 0.1450980392, green: 0.1568627451, blue: 0.168627451, alpha: 1)))
//                .font(.headline)
//                .frame(width: 358, height: 40, alignment: .topLeading)
//                .padding(.vertical,10)
//
//        }
//        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 20, alignment: .topLeading)
    }
}

struct ProfileButton: View {
    var body: some View {
        Image("Menu")
        .frame(width: 70 , height: 100, alignment: .topLeading)
        .padding(.horizontal, 30)
    }
}

struct Greetings: View {
    var nilai: Int
    var body: some View {
        VStack{
        Text("Hi Samantha")
            .font(.system(size: 40))
            .bold()
            .foregroundColor(Color.init(#colorLiteral(red: 0.1450980392, green: 0.1568627451, blue: 0.168627451, alpha: 1)))
            .frame(width: UIScreen.main.bounds.width, height: 50)
        Text("Lorem Ipsum et Dolor")
            .font(.headline)
            .foregroundColor(Color.init(#colorLiteral(red: 0.3215686275, green: 0.3411764706, blue: 0.3607843137, alpha: 1)))
        }
    }
}

struct Search: View {
   
    @State var searchSomething = ""
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.init(#colorLiteral(red: 0.6274509804, green: 0.6431372549, blue: 0.6588235294, alpha: 1)))
            TextField("Cari Poliklinik atau dokter", text: $searchSomething)
        }
        .frame(width: 320, height: 28)
            .padding()
            .background(Color.init(#colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9764705882, alpha: 1)))
            .cornerRadius(10)
        .padding()
    }
}



struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}



