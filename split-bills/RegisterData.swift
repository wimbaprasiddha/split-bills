//
//  RegisterData.swift
//  split-bills
//
//  Created by wimba prasiddha on 25/07/20.
//  Copyright © 2020 wimba prasiddha. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct RegisterData: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var isLoading: Bool = false
    @State var newName: String = ""
    @State var newBOD: String = ""
    @State var newGender: String = ""
    
    let image = "Register"
    private var userDefault = UserDefaults.standard
    private let email: String
    
    init(email: String) {
        self.email = email
    }
    
    var body: some View {
        VStack{
            Image(image)
                .padding()
            Text("Buat Data Pasien")
                .foregroundColor(Color.init(#colorLiteral(red: 0.1450980392, green: 0.1568627451, blue: 0.168627451, alpha: 1)))
                .font(.title)
                .bold()
            Text("Silahkan isi data dibawah")
                .foregroundColor(Color.init(#colorLiteral(red: 0.1450980392, green: 0.1568627451, blue: 0.168627451, alpha: 1)))
                .font(.subheadline)
                .padding(.vertical, 5)
            
            DataForm(newName: $newName, newBOD: $newBOD, newGender: $newGender)
            
            ZStack{
                
                Button(action: {
                    self.requestToSave()
                }) {
                    SubmitDataButton()
                        .padding(.vertical, 25)
                }
                
                ActivityIndicator(isAnimating: $isLoading, style: .large)
            }
            
        }
        
    }
    
    
    
    

    private func requestToSave(){
        isLoading = true
        let userID = "IOS-\(email)"
        Firestore.firestore().collection("user").document(userID).setData([
            "dateOfBirth" : newBOD,
            "name": newName,
            "sex": newGender
        ]) { (err) in
            
            self.isLoading = false
            
            if let err = err{
                print(err.localizedDescription)
                return
            }
            
            self.userDefault.setValue(true, forKey: UserDefaultKey.isUserLoggedIn.rawValue)
            self.userDefault.setValue(userID, forKey: UserDefaultKey.userID.rawValue)
            
            self.viewRouter.initialPage = AnyView(HomePage().environmentObject(self.viewRouter))
            
        }
    }
}





struct DataForm: View {
//    @State var newName = ""
//    @State var newBOD  = ""
//    @State var newGender = ""
//
    @Binding var newName: String
    @Binding var newBOD: String
    @Binding var newGender: String
    
    var body: some View {
        VStack{
            
            HStack(spacing:15) {
                Image(systemName: "person")
                    .foregroundColor(Color.init(#colorLiteral(red: 0.1450980392, green: 0.1568627451, blue: 0.168627451, alpha: 1)))
                TextField("Tuliskan Nama Kamu", text: $newName)
            }
            .padding(.vertical,20)
            Divider()
            
            HStack(spacing: 15) {
                Image(systemName: "calendar")
                    //                        .resizable()
                    //                        .frame(width: 15, height: 18)
                    .foregroundColor(Color.init(#colorLiteral(red: 0.1450980392, green: 0.1568627451, blue: 0.168627451, alpha: 1)))
                SecureField("Pilih Tanggal Lahir", text: $newBOD)
                
                
            }
            .padding(.vertical, 20)
            Divider()
            
            HStack(spacing: 15) {
                Image(systemName: "person")
                    
                    .foregroundColor(Color.init(#colorLiteral(red: 0.1450980392, green: 0.1568627451, blue: 0.168627451, alpha: 1)))
                
                SecureField("Pilih Jenis Kelamin", text: $newGender)
                
            }
            .padding(.vertical,20)
            Divider()
        }
            
        .padding(.vertical)
        .padding(.leading,40)
    }
}

struct SubmitDataButton: View {
    var body: some View {
        Text("Mulai")
            .foregroundColor(.white)
            .frame(width: 330, height: 25)
            .padding()
            .background(Color.init(#colorLiteral(red: 0.06666666667, green: 0.3019607843, blue: 0.5882352941, alpha: 1)))
            .cornerRadius(15)
            .shadow(color: Color.init(#colorLiteral(red: 0.8, green: 0.8392156863, blue: 0.9254901961, alpha: 1)), radius: 8, x: 0, y: 6)
    }
}


struct RegisterData_Previews: PreviewProvider {
    static var previews: some View {
        RegisterData(email: "EMAIl")
    }
}
