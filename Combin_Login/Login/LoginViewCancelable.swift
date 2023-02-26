//
//  LoginView.swift
//  SwiftUI_Combine_macOS
//
//  Created by hesper on 2023-02-25(Sat).
//

import Foundation
import SwiftUI

struct LoginViewCancelable: View {
    @ObservedObject var user = LoginVMCancelable()
    
//    @StateObject var user = LoginVMCancelable()

    
    var body: some View {
        VStack {
            TextField("name", text: self.$user.userName)
            Text(self.user.userNameValidation)
                
            SecureField("password", text: self.$user.userPasswd)
            Text(self.user.userPasswdValidation)
            
            Button("Cancel validation") {
                self.user.cancelAll()
            }
            
            Button("chnage") {
                self.user.classProperty = LoginViewModel()
            }

            
        }
    }
}


