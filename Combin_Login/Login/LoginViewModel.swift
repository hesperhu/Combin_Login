//
//  LoginViewModel.swift
//  SwiftUI_Combine_macOS
//
//  Created by hesper on 2023-02-25(Sat).
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var userNameValidation: String = ""
    @Published var userPasswd: String = ""
    @Published var userPasswdValidation: String = ""
    
    init() {
        $userName
            .map { $0 == "" ? "Name is empty" : "Good"}
            .assign(to: &$userNameValidation)
        $userPasswd
            .map { $0 == "" ? "password is empty" : "Good"}
            .assign(to: &$userPasswdValidation)
    }
}
