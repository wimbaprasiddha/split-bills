//
//  ViewRouter.swift
//  split-bills
//
//  Created by wimba prasiddha on 24/07/20.
//  Copyright © 2020 wimba prasiddha. All rights reserved.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    @Published var initialPage: AnyView

    private var userDefault: UserDefaults  = UserDefaults()
    
    init() {
        
        if userDefault.bool(forKey: UserDefaultKey.onLoginPage.rawValue){
            initialPage = AnyView(LoginScreen())
        }else{
            initialPage = AnyView(OnboardingView())
        }
        
    }
    
    func changeToHome(_ binder: Published<Bool>){
        
    }
    
    
}

