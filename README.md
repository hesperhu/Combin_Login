使用Combine来验证登录中的用户名和密码合法性

# 需求

在用户登录时，需要实时验证账号和密码不为空

# 步骤

## 使用combine架构创建view model

```swift
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
```

## 使用SwiftUI创建登录界面

```swift
struct LoginView: View {
    @ObservedObject var user = LoginViewModel()
    
    var body: some View {
        VStack {
            TextField("name", text: self.$user.userName)
            Text(self.user.userNameValidation)
                
            SecureField("password", text: self.$user.userPasswd)
            Text(self.user.userPasswdValidation)
        }
    }
}
```

## 在应用中使用登录界面

```swift
struct Combin_LoginApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
```

# 效果

![hsw_2023-02-25_15.28.07](/media/16772915697977/hsw_2023-02-25_15.28.07.png)

