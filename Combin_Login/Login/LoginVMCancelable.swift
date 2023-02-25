//
//  LoginVMCancelable.swift
//  Combin_Login
//
//  Created by hesper on 2023-02-25(Sat).
//

import Foundation
import Combine


class LoginVMCancelable: ObservableObject {
    @Published var userName: String = ""
    @Published var userNameValidation: String = ""
    @Published var userPasswd: String = ""
    @Published var userPasswdValidation: String = ""
    
    private var cancels : Set<AnyCancellable> = []
    
    init() {
        $userName
            .map { $0 == "" ? "Name is empty" : "Good"}
            .sink { [unowned self] name in
                self.userNameValidation = name
            }
            .store(in: &self.cancels)
        $userPasswd
            .map { $0 == "" ? "password is empty" : "Good"}
            .sink { [unowned self] passwd in
                self.userPasswdValidation = passwd
            }
            .store(in: &self.cancels)
    }
    
    func cancelAll() {
        self.cancels.removeAll()
    }
}
