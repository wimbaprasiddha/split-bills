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
    @Published var currentPage: String
    
    init() {
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore"){
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            currentPage = "onboardingView"
        } else {
            currentPage = "loginScreen"
        }
        
    }
}
