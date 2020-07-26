//
//  RegisterAkun.swift
//  split-bills
//
//  Created by wimba prasiddha on 25/07/20.
//  Copyright © 2020 wimba prasiddha. All rights reserved.
//

import SwiftUI
import FirebaseAuth


class RegisterAccountFactory: ObservableObject{
    @Published var newEmail: String = ""
    @Published var newPass: String = ""
    @Published var rePass: String = ""
}


struct RegisterAccount: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var factory: RegisterAccountFactory = RegisterAccountFactory()
    
    @State var showAlert: Bool = false
    @State var alert: Alert?
    @State var isLoading: Bool = false
    let image = "Register"
    
    
    var body: some View {
        VStack{
          Image(image)
            .padding()
            Text("Register Akun Baru")
                .foregroundColor(Color.init(#colorLiteral(red: 0.1450980392, green: 0.1568627451, blue: 0.168627451, alpha: 1)))
                .font(.title)
                .bold()
            Text("Silahkan isi data dibawah")
                .foregroundColor(Color.init(#colorLiteral(red: 0.1450980392, green: 0.1568627451, blue: 0.168627451, alpha: 1)))
                .font(.subheadline)
                .padding(.vertical, 5)
            
            AccountForm()
                .environmentObject(factory)
            
            ZStack{
                
                Button(action: {
                    if let errMsg = self.passwordValidation(){
                        self.showAlert(title: errMsg, subtitle: "")
                    }else{
                        self.createAccount()
                    }
                    
                }) {
                    CreateAccountButton()
                        .padding(.vertical, 25)
                }
                
                ActivityIndicator(isAnimating: $isLoading, style: .large)
                
            }
            
        }.alert(isPresented: $showAlert) { () -> Alert in
            alert!
        }
    }
    
    
    
    
    
    private func createAccount(){
        isLoading = true
        Auth.auth().createUser(withEmail: factory.newEmail, password: factory.newPass, completion: { (result, err) in
            self.isLoading = false
            if let errMsg = err{
                self.showAlert(title: "Gagal Buat Akun", subtitle: errMsg.localizedDescription)
                return
            }
            
            self.viewRouter.initialPage = AnyView(HomePage().environmentObject(self.viewRouter))
            
            
        })
    }
    
    private func passwordValidation() -> String?{
        var errorMessage: String? = nil
        
        if factory.newPass != factory.rePass{
            errorMessage = "Password harus sama!"
        }else if factory.newPass.count < 8{
            errorMessage = "Passoword minimal 8 karakter!"
        }
        
        if let errMsg = errorMessage{
            return errMsg
        }
        
        return nil
    }
    
    private func showAlert(title: String, subtitle: String){
        
        self.alert = Alert(
            title: Text(title),
            message: Text(subtitle),
            dismissButton: .default(Text("OK"), action: {
            self.alert = nil
            self.showAlert = false
        }))
        
        self.showAlert = true
    }
    
    
}

struct AccountForm: View {
    @EnvironmentObject var factory: RegisterAccountFactory
    var body: some View {
        VStack{
                       
            HStack(spacing:15) {
                Image(systemName: "envelope")
                    .foregroundColor(Color.init(#colorLiteral(red: 0.6274509804, green: 0.6431372549, blue: 0.6588235294, alpha: 1)))
                TextField("Masukan Alamat Email", text: $factory.newEmail)
            }
                .padding(.vertical,20)
                Divider()
                       
            HStack(spacing: 15) {
                Image(systemName: "lock")
                    .resizable()
                    .frame(width: 15, height: 18)
                    .foregroundColor(Color.init(#colorLiteral(red: 0.6274509804, green: 0.6431372549, blue: 0.6588235294, alpha: 1)))
                SecureField("Masukan Password", text: $factory.newPass)
                
                Button(action: {
                }) {
                    Image(systemName: "eye")
                        .foregroundColor(Color.init(#colorLiteral(red: 0.6274509804, green: 0.6431372549, blue: 0.6588235294, alpha: 1)))
                    }
                .padding()
            }
                .padding(.vertical, 10)
                Divider()
            
            HStack(spacing: 15) {
                Image(systemName: "lock")
                    .resizable()
                    .frame(width: 15, height: 18)
                    .foregroundColor(Color.init(#colorLiteral(red: 0.6274509804, green: 0.6431372549, blue: 0.6588235294, alpha: 1)))
                SecureField("Masukan Ulang Password", text: $factory.rePass)
                
                Button(action: {
                }) {
                    Image(systemName: "eye")
                        .foregroundColor(Color.init(#colorLiteral(red: 0.6274509804, green: 0.6431372549, blue: 0.6588235294, alpha: 1)))
                    }
                    .padding()
            }
            .padding(.vertical,10)
            Divider()
        }
            
        .padding(.vertical)
        .padding(.leading,40)
    }
}


struct CreateAccountButton: View {
       var body: some View {
           Text("Buat Akun")
               .foregroundColor(.white)
               .frame(width: 330, height: 25)
               .padding()
               .background(Color.init(#colorLiteral(red: 0.06666666667, green: 0.3019607843, blue: 0.5882352941, alpha: 1)))
               .cornerRadius(15)
               .shadow(color: Color.init(#colorLiteral(red: 0.8, green: 0.8392156863, blue: 0.9254901961, alpha: 1)), radius: 8, x: 0, y: 6)
       }
   }

struct RegisterAkun_Previews: PreviewProvider {
    static var previews: some View {
        RegisterAccount()
    }
}
