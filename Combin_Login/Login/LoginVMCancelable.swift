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
    //测试class的对象属性是否可用。2023-02-26(周日) 21:20:28
    @Published var classProperty = LoginViewModel()
    
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
        
        $classProperty
            .sink { _ in
                print("changed")
            }
            .store(in: &self.cancels)
        
    }
    
    func cancelAll() {
        self.cancels.removeAll()
    }
}
